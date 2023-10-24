import { hash } from 'bcrypt'
import prisma from '@/app/_lib/prisma'
import { ServiceResponse } from '@/app/_types/service_response'
import { Account } from '@/app/_types/account'
import { SERVICE_ERRORS } from '@/app/_lib/constants'

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
        error: 'This email has already been registered to an account.', 
        errorType: SERVICE_ERRORS.ALREADY_EXISTS
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

    return Promise.resolve({ success: 'The account has successfully been created!' })
  } catch(error) {
    return Promise.reject({ 
      error: 'There was as issue with registration. Please see your administrator.',
      errorType: SERVICE_ERRORS.GENERIC_ERROR
    })
  }
}

