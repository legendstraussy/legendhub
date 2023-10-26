'use client'

import { signOut, useSession } from 'next-auth/react'
import Link from 'next/link'

export default function LoginButton() {
  const session = useSession()

  console.log('bingo', session)

  return (
    <>
      {session.data
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