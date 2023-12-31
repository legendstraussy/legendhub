import { NextAuthOptions } from 'next-auth'
import { compare } from 'bcrypt'
import CredentialsProvider from 'next-auth/providers/credentials'
import prisma from '@/app/_lib/prisma'
import { ERROR_MESSAGES, ROUTES } from '@/app/_lib/constants'

declare module 'next-auth' {
  interface User {
    id: number
    email: string
  }

  interface Session {
    user: {
      id?: number
      email?: string
      firstName?: string
      role?: string
    }
  }
}

export const authOptions: NextAuthOptions = {
  providers: [
    CredentialsProvider({
      name: 'Credentials',
      credentials: {
        email: {},
        password: {}
      },
      async authorize (credentials, req) {
        const { email, password = '' } = credentials
        const ip = req.headers['x-forwarded-for']
        const formattedIP = ip.replace('::ffff:', '')
        const ipAddress = formattedIP === '::1' ? '127.0.0.1' : formattedIP

        try {
          const blackListedNetwork = await prisma.networkBlacklist.findFirst({
            select: {
              ipAddress: true
            },
            where: {
              ipAddress
            }
          })

          if (blackListedNetwork?.ipAddress) {
            throw new Error(ERROR_MESSAGES.NETWORK_IP_BANNED)
          }
          
          const existingAccount = await prisma.account.findUnique({
            where: {
              email
            }
          })

          if (!existingAccount) {
            throw new Error(ERROR_MESSAGES.INVALID_LOGIN)
          }

          const { id: accountId } = existingAccount

          const existingAccountPassword = await prisma.accountPassword.findFirst({
            where: {
              accountId
            }
          })

          const existingPassword = password ?? ''
          const existingHash = existingAccountPassword?.passwordHash ?? ''

          const passwordMatch = await compare(existingPassword, existingHash)

          if (!passwordMatch) {
            throw new Error(ERROR_MESSAGES.INVALID_LOGIN)
          }
          
          const deleteNeworkHistory = prisma.networkHistory.deleteMany({
            where: {
              accountId
            }
          })

          const createNetworkHistory = prisma.networkHistory.create({
            data: {
              accountId,
              ipAddress
            }
          })
        
          await prisma.$transaction([deleteNeworkHistory, createNetworkHistory])

          return existingAccount
        } catch (e) {
          throw new Error(e)
        }
      }
    })
  ],
  callbacks: {
    async jwt({ token, user }) {
      if (user) {
        token.user = user
      }
      return token
    },
    async session({ session, token }) {
      session.user = token.user
      return session
    }
  },
  session: { 
    strategy: 'jwt',
    maxAge: 4 * 24 * 60 * 60 // 4 hours
  },
  pages: {
    signIn: ROUTES.LOGIN
  }
}