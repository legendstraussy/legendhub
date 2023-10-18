'use client'

import { useState } from 'react'

const inputStyles = `border border-solid border-red`

export default function RegisterForm() {
  const [email, setEmail] = useState<string>('')
  const [password, setPassword] = useState<string>('')
  const [confirmPassword, setConfirmPassword] = useState<string>('')
  const [error, setError] = useState<string | null>(null)

  const handleOnSubmit = (event) => {
    event.preventDefault()
    
    if (!email || !password || !confirmPassword) return setError('please provide required fields.')
    if (password !== confirmPassword) return setError('please confirm password.')
    console.log('bingo submit', email, password, confirmPassword)
    
  }

  return (
    <form onSubmit={handleOnSubmit} className="w-[20rem] m-8 flex flex-col gap-y-4">
      {error && <h4>{error}</h4>}
      <p>account email*</p>
      <input className={inputStyles} value={email} onChange={event => setEmail(event.target.value)} />
      <p>password*</p>
      <input className={inputStyles} value={password} onChange={event => setPassword(event.target.value)} />
      <p>confirm password*</p>
      <input className={inputStyles} value={confirmPassword} onChange={event => setConfirmPassword(event.target.value)} />
      <button className="self-end border border-solid px-4" type="submit">register</button>
    </form>  )
}