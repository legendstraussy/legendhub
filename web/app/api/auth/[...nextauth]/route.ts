import NextAuth, { AuthOptions } from 'next-auth'
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

export const authOptions: AuthOptions = {
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

          await prisma.networkHistory.create({
            data: {
              accountId,
              ipAddress
            }
          })

          return existingAccount
        } catch {
          throw new Error(ERROR_MESSAGES.INVALID_LOGIN)
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
    maxAge: 3 * 24 * 60 * 60
  },
  pages: {
    signIn: ROUTES.LOGIN
  }
}

const handler = NextAuth(authOptions)

export { handler as GET, handler as POST }