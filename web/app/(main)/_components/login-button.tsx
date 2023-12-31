'use client'

import { ROUTES } from '@/app/_lib/constants'
import { signOut } from 'next-auth/react'
import Link from 'next/link'

export default function LoginButton({ session }) {
  return (
    <>
      {session?.user
        ? <button onClick={() => signOut()}>logoff</button> 
        : (
          <span>
            <Link className="mr-2" href={ROUTES.LOGIN}>login</Link>
            <Link href={ROUTES.REGISTER}>(register)</Link>
          </span>
        )
      }
    </>
  )
}