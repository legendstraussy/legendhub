'use client'

import { useState } from 'react'

export default function RegisterForm() {
  const [email, setEmail] = useState<string>('')
  const [password, setPassword] = useState<string>('')
  const [confirmPassword, setConfirmPassword] = useState<string>('')

  const handleOnSubmit = () => {
    console.log('bingo submit !!', email, password, confirmPassword)
  }

  return (
    <form onSubmit={handleOnSubmit} className="w-[20rem] m-8 flex flex-col gap-y-4">
      <input value={email} onChange={event => setEmail(event.target.value)} />
      <input value={password} onChange={event => setPassword(event.target.value)} />
      <input value={confirmPassword} onChange={event => setConfirmPassword(event.target.value)} />
      <button type="submit">register</button>
    </form>  )
}