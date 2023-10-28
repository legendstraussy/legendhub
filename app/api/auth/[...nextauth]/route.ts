import NextAuth, { AuthOptions } from 'next-auth'
import { compare } from 'bcrypt'
import CredentialsProvider from 'next-auth/providers/credentials'
import prisma from '@/app/_lib/prisma'
import { ROUTES } from '@/app/_lib/constants'

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
            return existingAccount
          }

          throw new Error('invalid password or account email.')
        } catch {
          throw new Error('invalid password or account email.')
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
      // console.log('bingo token.user', token.user)
      session.user = token.user
      return session
    }
  },
  session: { 
    strategy: 'jwt',
    // maxAge: 5, // test
    maxAge: 3 * 24 * 60 * 60
  },
  pages: {
    signIn: ROUTES.LOGIN
  }
}

const handler = NextAuth(authOptions)

export { handler as GET, handler as POST }