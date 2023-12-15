import { hash } from 'bcrypt'
import prisma from '@/app/_lib/prisma'
import { ServiceResponse } from '@/app/_types/service_response'
import { Account } from '@/app/_types/account'
import { ERROR_MESSAGES, SUCCESS_MESSAGES } from '@/app/_lib/constants'
import jwt from 'jsonwebtoken'

interface Token {
  email: string,
  exp: number
}

export async function registerUser(registrant: Account): Promise<ServiceResponse> {
  const { email, firstName = 'Brian', lastName = 'Selvaggio', password } = registrant

  try {
    const existingAccount = await prisma.account.findUnique({
      where: {
        email
      }
    })
  
    if (existingAccount) {
      return Promise.resolve({ 
        error: ERROR_MESSAGES.ALREADY_EXISTS
      })
    }
  
    const passwordHash = await hash(password, 10)
    const mudId = Math.floor(Math.random() * 1000) + 1
    const preferences = {
      showPanel: false,
      theme: 'work'
    }

    const newAccount = await prisma.account.create({ 
      data: {
        email,
        firstName,
        lastName,
        mudId: mudId.toString(),
        preferences
      }
    })
  
    await prisma.accountPassword.create({
      data: {
        accountId: newAccount.id,
        passwordHash
      }
    })

    return Promise.resolve({ 
      success: SUCCESS_MESSAGES.ACCOUNT_CREATED
    })
  } catch (e) {
    return Promise.reject({ 
      error: `${ERROR_MESSAGES.GENERIC_ERROR}: ${e}`
    })
  }
}

export async function resetPasswordRequest(registrant: Account): Promise<ServiceResponse> {
  const { email } = registrant

  try {
    const existingAccount = await prisma.account.findUnique({
      where: {
        email
      }
    })

    if (!existingAccount) {
      return Promise.resolve({ 
        error: ERROR_MESSAGES.ACCOUNT_RESET
      })
    }

    await prisma.accountPasswordReset.deleteMany({
      where: {
        accountId: existingAccount.id
      }
    })
    
    const resetToken = jwt.sign({ email }, process.env.RESET_TOKEN_SECRET, {
      expiresIn: 60 * 60
    })
    const url = `${process.env.BASE_URL}/reset/${resetToken}`
    
    await prisma.accountPasswordReset.create({
      data: {
        accountId: existingAccount.id,
        resetToken
      }
    })

    return Promise.resolve({ 
      success: url
    })

  } catch(e) {
    return Promise.reject({ 
      error: `${ERROR_MESSAGES.GENERIC_ERROR}: ${e}`
    })
  }
}

export async function resetPassword({ password, token }) {
  try {
    if (!password || !token) return

    const { email, exp } = <Token>jwt.verify(token, process.env.RESET_TOKEN_SECRET)

    const { id: accountId } = await prisma.account.findUnique({
      where: {
        email
      }
    })

    const existingAccount = await prisma.accountPasswordReset.findFirst({
      where: {
        accountId
      }
    })

    if (!existingAccount) return

    if (Date.now() >= exp * 1000) {
      return Promise.reject({ 
        error: ERROR_MESSAGES.RESET_TOKEN_EXPIRED
      })
    }
    
    const deletePasswordReset = prisma.accountPasswordReset.delete({
      where: {
        id: existingAccount.id
      }
    })

    const currentPassword = await prisma.accountPassword.findFirst({
      where: {
        accountId
      }
    })

    const passwordHash = await hash(password, 10)
    const updatedPassword = prisma.accountPassword.update({
      where: {
        id: currentPassword.id
      },
      data: {
        createdDate: new Date(),
        passwordHash
      }
    })

    await prisma.$transaction([deletePasswordReset, updatedPassword])

    return Promise.resolve({ 
      success: SUCCESS_MESSAGES.PASSWORD_RESET
    })
  } catch(e) {
    return Promise.reject({ 
      error: `${ERROR_MESSAGES.GENERIC_ERROR}: ${e}`
    })
  }
}

export async function validateResetToken({ token }) {
  try {
    const existingToken = await prisma.accountPasswordReset.findFirst({
      where: {
        resetToken: token
      }
    })

    if (!existingToken) {
      return Promise.resolve({ 
        error: ERROR_MESSAGES.RESET_TOKEN_INVALID
      })
    }

    return Promise.resolve({ success: '' })
  } catch(e) {
    return Promise.reject({ 
      error: `${ERROR_MESSAGES.GENERIC_ERROR}: ${e}`
    })
  }
}