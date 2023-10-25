import NextAuth, { AuthOptions } from 'next-auth'
import { compare } from 'bcrypt'
import CredentialsProvider from 'next-auth/providers/credentials'
import prisma from '@/app/_lib/prisma'

declare module 'next-auth' {
  interface User {
    id: number
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
      async authorize (credentials, _req) {
        const { email, password = '' } = credentials

        try {
          const existingAccount = await prisma.account.findUnique({
            where: {
              email
            }
          })

          const existingAccountPassword = await prisma.accountPassword.findFirst({
            where: {
              accountId: existingAccount?.id
            }
          })

          const existingPassword = password ?? ''
          const existingHash = existingAccountPassword?.passwordHash ?? ''

          const passwordMatch = await compare(existingPassword, existingHash)

          if (passwordMatch) {
            return { id: existingAccount.id, email, password }
          }

          throw new Error('invalid password or account email.')
        } catch {
          throw new Error('invalid password or account email.')
        }
      }
    })
  ],
  session: { 
    strategy: 'jwt',
    // maxAge: 10, // test
    maxAge: 3 * 24 * 60 * 60
  },
  pages: {
    signIn: '/login'
  }
}

const handler = NextAuth(authOptions)

export { handler as GET, handler as POST }