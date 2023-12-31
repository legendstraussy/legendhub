'use client'

import { useState } from 'react'

type status = {
  message: string,
  isSuccess?: boolean
}

const inputStyles = `border border-solid border-red`

export default function RegisterForm() {
  const [email, setEmail] = useState<string>('straussy@legendmud.org')
  const [password, setPassword] = useState<string>('test')
  const [confirmPassword, setConfirmPassword] = useState<string>('test')
  const [status, setStatus] = useState<status | null>({ message: '', isSuccess: false })

  const handleOnSubmit = async (event: React.FormEvent) => {
    event.preventDefault()
    
    if (!email || !password || !confirmPassword) return setStatus({ message: 'please provide required fields.' })
    if (password !== confirmPassword) return setStatus({ message: 'please confirm password.' })

    const { error, success } = await fetch('/api/register', {
      method: 'POST',
      body: JSON.stringify({ email, password }),
    }).then(response => response.json())

    if (error) return setStatus({ message: error })
    
    if (success) {
      setStatus({ message: success, isSuccess: true })
    }
  }

  return (
    <form onSubmit={handleOnSubmit} className="w-[20rem] m-8 flex flex-col gap-y-4">
      {status && <h4 className={`${status.isSuccess ? 'text-[green]' : 'text-[red]'}`}>{status.message}</h4>}
      <p>account email*</p>
      <input className={inputStyles} value={email} onChange={event => setEmail(event.target.value)} />
      <p>password*</p>
      <input className={inputStyles} value={password} onChange={event => setPassword(event.target.value)} />
      <p>confirm password*</p>
      <input className={inputStyles} value={confirmPassword} onChange={event => setConfirmPassword(event.target.value)} />
      <button className="self-end border border-solid px-4" type="submit">register</button>
    </form>  )
}