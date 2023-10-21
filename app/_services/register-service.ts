import bcrypt from "bcrypt"
// import prisma from '@/app/_lib/prisma'
import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient()
import { Account } from '@/app/_types/account'

export async function registerUser(registrant: Account) {
  const { email, firstName = 'Brian', lastName = 'Selvaggio', password } = registrant

  // const existingAccount = await prisma.account.findUnique({
  //   where: {
  //     email
  //   }
  // })

  // if (existingAccount) {
  //   console.log('bingo existingAccount', existingAccount)
  //   const existingAccountHash = await prisma.accountPassword.findFirst({
  //     where: {
  //       accountId: existingAccount.id
  //     }
  //   })

  //   return Promise.reject('Account exists.')
  // }

  // if (existingAccount) return Promise.reject('Account may still exists. Please see an administrator.')

  const passwordHash = await bcrypt.hash(password, 10)
  const mudId = Math.floor(Math.random() * 1000) + 1
  const preferences = {
    showPanel: false,
    theme: 'work'
  }

  try {
    const newAccount = prisma.account.create({ 
      data: {
        email,
        firstName,
        lastName,
        mudId: mudId.toString(),
        preferences
      }
    })
  
    const newAccountPassword = prisma.accountPassword.create({
      data: {
        accountId: newAccount.id,
        passwordHash
      }
    })

    return await prisma.$transaction([newAccount, newAccountPassword])
  } catch(error) {
    return Promise.reject(`There was a problem creating the account. ${error}`)
  }

}

