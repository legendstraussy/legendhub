'use client'

import { useRouter } from "next/navigation";
import { useState } from 'react'
import { ROUTES } from '@/app/_lib/constants'

type status = {
  message: string,
  isSuccess?: boolean
}

const inputStyles = `border border-solid border-red`

export default function ResetForm({ token }) {
  const [password, setPassword] = useState<string>('test')
  const [confirmPassword, setConfirmPassword] = useState<string>('test')
  const [status, setStatus] = useState<status | null>({ message: '', isSuccess: false })
  const router = useRouter()

  const handleOnSubmit = async (event: React.FormEvent) => {
    event.preventDefault()
    
    if (!password || !confirmPassword) return setStatus({ message: 'please provide required fields.' })
    if (password !== confirmPassword) return setStatus({ message: 'please confirm password.' })

    const { error, success } = await fetch('/api/reset-password', {
      method: 'POST',
      body: JSON.stringify({ password, token }),
    }).then(response => response.json())

    if (success) {
      router.push(ROUTES.LOGIN)
    }
  }

  return (
    <form onSubmit={handleOnSubmit} className="w-[20rem] m-8 flex flex-col gap-y-4">
      {status && <h4 className={`${status.isSuccess ? 'text-[green]' : 'text-[red]'}`}>{status.message}</h4>}
      <p>new password*</p>
      <input className={inputStyles} value={password} onChange={event => setPassword(event.target.value)} />
      <p>confirm new password*</p>
      <input className={inputStyles} value={confirmPassword} onChange={event => setConfirmPassword(event.target.value)} />
      <button className="self-end border border-solid px-4" type="submit">reset password</button>
    </form>  )
}