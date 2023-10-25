'use client'

import { signOut } from 'next-auth/react'
import Link from 'next/link'

export default function LoginButton({ session }) {
  return (
    <>
      {session 
        ? <button onClick={() => signOut()}>logoff</button> 
        : (
          <span>
            <Link className="mr-2" href="/login">login</Link>
            <Link href="/register">(register)</Link>
          </span>
        )
      }
    </>
  )
}