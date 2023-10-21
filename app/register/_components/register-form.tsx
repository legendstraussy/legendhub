'use client'

import { useState } from 'react'

const inputStyles = `border border-solid border-red`

export default function RegisterForm() {
  const [email, setEmail] = useState<string>('test')
  const [password, setPassword] = useState<string>('test')
  const [confirmPassword, setConfirmPassword] = useState<string>('test')
  const [errorStatus, setErrorStatus] = useState<string | null>(null)

  const handleOnSubmit = async (event) => {
    event.preventDefault()
    
    if (!email || !password || !confirmPassword) return setErrorStatus('please provide required fields.')
    if (password !== confirmPassword) return setErrorStatus('please confirm password.')

    const { message } = await fetch('/api/register', {
      method: 'POST',
      body: JSON.stringify({ email, password }),
    }).then(response => response.json())

    if (message) return setErrorStatus(message)
    
    return setErrorStatus(null)
  }

  return (
    <form onSubmit={handleOnSubmit} className="w-[20rem] m-8 flex flex-col gap-y-4">
      {errorStatus && <h4 className="text-[red]">{errorStatus}</h4>}
      <p>account email*</p>
      <input className={inputStyles} value={email} onChange={event => setEmail(event.target.value)} />
      <p>password*</p>
      <input className={inputStyles} value={password} onChange={event => setPassword(event.target.value)} />
      <p>confirm password*</p>
      <input className={inputStyles} value={confirmPassword} onChange={event => setConfirmPassword(event.target.value)} />
      <button className="self-end border border-solid px-4" type="submit">register</button>
    </form>  )
}