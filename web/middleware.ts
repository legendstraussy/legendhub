import { withAuth } from 'next-auth/middleware'
import { NextResponse } from 'next/server'

const LIMITED_ROUTES = ['/login', '/register', '/reset']

export default withAuth((req) => {
  const { pathname, searchParams } = req.nextUrl
  const callbackUrl = new URLSearchParams(searchParams).get('callbackUrl')

  if (req.nextauth.token) {
    if (callbackUrl) return NextResponse.redirect(callbackUrl)
  }

  if (LIMITED_ROUTES.includes(pathname)) {
    if (req.nextauth.token) {
      return NextResponse.redirect(new URL('/', req.url))
    }
  }
},
{
  callbacks: {
    authorized: async ({ req, token }) => {
      const { pathname } = req.nextUrl

      if (LIMITED_ROUTES.includes(pathname)) {
        if (!token) return true
      }
    }
  }
})

export const config = {
  matcher: ['/dashboard', '/register', '/login', '/reset']
}