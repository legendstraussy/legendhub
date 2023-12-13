'use client'

import { useRouter } from 'next/navigation'
import Link from 'next/link'
import { signIn } from 'next-auth/react'
import { useState } from 'react'
import { SUCCESS_MESSAGES } from '@/app/_lib/constants'

type status = {
  message: string,
  isSuccess?: boolean
}

const inputStyles = `border border-solid border-red`

export default function LoginForm() {
  const [email, setEmail] = useState<string>('straussy@legendmud.org')
  const [password, setPassword] = useState<string>('test')
  const [status, setStatus] = useState<status | null>({ message: '', isSuccess: false })
  const router = useRouter()

  const handleOnSubmit = async (event: React.FormEvent) => {
    event.preventDefault()
    
    if (!email || !password) return setStatus({ message: 'please provide required fields.' })

    const { error, url } = await signIn('credentials', { email, password, redirect: false })

    if (error) {
      setStatus({ message: error })
    }

    if (url) {
      router.push(url)
      router.refresh()
    }
  }

  const handleResetPassword = async (event: React.MouseEvent) => {
    event.preventDefault()

    const { error, success } = await fetch('/api/forgot-password', {
      method: 'POST',
      body: JSON.stringify({ email }),
    }).then(response => Promise.resolve(response.json()))

    setStatus({ message: error ?? <Link href={success}>{SUCCESS_MESSAGES.ACCOUNT_RESET}</Link> })
  }

  return (
    <form onSubmit={handleOnSubmit} className="w-[20rem] m-8 flex flex-col gap-y-4">
      {status && <h4 className={`${status.isSuccess ? 'text-[green]' : 'text-[red]'}`}>{status.message}</h4>}
      <p>account email*</p>
      <input className={inputStyles} value={email} onChange={event => setEmail(event.target.value)} />
      <p>password*</p>
      <input type="password" className={inputStyles} value={password} onChange={event => setPassword(event.target.value)} />
      <button className="self-end border border-solid px-4" type="submit">login</button>
      <button className="self-end border border-solid px-4" onClick={handleResetPassword}>forgot password</button>
    </form>  )
}