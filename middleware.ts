import { withAuth } from 'next-auth/middleware'
import { NextResponse } from 'next/server'

export default withAuth((req) => {
  if ( req.nextUrl.pathname.startsWith('/register') ) {
    if (req.nextauth.token) {
      return NextResponse.redirect(new URL('/', req.url))
    }
  }
  
  if ( req.nextUrl.pathname.startsWith('/login') ) {
    if (req.nextauth.token) {
      return NextResponse.redirect(new URL('/', req.url))
    }
  }
},
{
  callbacks: {
    authorized: async ({ req, token }) => {
      const pathname = req.nextUrl.pathname

      if (pathname === '/register') {
        if (!token) return true
      }

      if (pathname === '/login') {
        if (!token) return true
      }
    }
  }
})

export const config = {
  matcher: ['/dashboard', '/register', '/login']
}