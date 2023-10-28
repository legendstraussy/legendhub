'use client'

import { SessionProvider, signOut, useSession } from 'next-auth/react'
import { usePathname } from 'next/navigation'
import { useEffect } from 'react'
import { AUTH_EXPIRATION_LOOP_CHECK_SECONDS, ROUTES } from '@/app/_lib/constants'

type NextAuthProviderProps = {
  children?: React.ReactNode
}

function ExpirationCheck({ children }: NextAuthProviderProps ) {
  const pathname = usePathname()
  const { data } = useSession()
  const { expires = null } = data ?? {}

  useEffect(() => {
    const expireCheck = setInterval(() => {
      const isSiteSessionExpired = new Date() > new Date(expires)

      if (pathname === ROUTES.LOGIN) return 
      if (!expires) return 

      if (isSiteSessionExpired) {
        signOut()
      }
    }, AUTH_EXPIRATION_LOOP_CHECK_SECONDS)

    return () => clearInterval(expireCheck)
  }, [data, expires, pathname]);
  
  return (
    <>
      {children}
    </>
  )
}

export const NextAuthProvider = ({ children }: NextAuthProviderProps) => {
  return (
    <SessionProvider>
      <ExpirationCheck>
        {children}
      </ExpirationCheck>
    </SessionProvider>
  )
}