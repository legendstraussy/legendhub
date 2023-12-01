import { hash } from 'bcrypt'
import prisma from '@/app/_lib/prisma'
import { ServiceResponse } from '@/app/_types/service_response'
import { Account } from '@/app/_types/account'
import { ERROR_MESSAGES, SUCCESS_MESSAGES } from '@/app/_lib/constants'

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
  } catch {
    return Promise.reject({ 
      error: ERROR_MESSAGES.GENERIC_ERROR
    })
  }
}

