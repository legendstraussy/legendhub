'use client'

import { SessionProvider, signOut, useSession } from 'next-auth/react'
import { usePathname } from 'next/navigation'
import { useEffect } from 'react'
import { SESSION_CHECK_TIME_MS, ROUTES } from '@/app/_lib/constants'

type NextAuthProviderProps = {
  children?: React.ReactNode
}

function SessionCheck({ children }: NextAuthProviderProps ) {
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
    }, SESSION_CHECK_TIME_MS)

    return () => clearInterval(expireCheck)
  }, [expires, pathname])
  
  return (
    <>
      {children}
    </>
  )
}

export const NextAuthProvider = ({ children }: NextAuthProviderProps) => {
  return (
    <SessionProvider>
      <SessionCheck>
        {children}
      </SessionCheck>
    </SessionProvider>
  )
}