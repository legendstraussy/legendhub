'use client'

import { useRouter } from 'next/navigation'
import { signIn } from 'next-auth/react'
import { useEffect, useRef, useState } from 'react'

type status = {
  message: string,
  isSuccess?: boolean
}

const inputStyles = `border border-solid border-red`

export default function LoginForm() {
  const [email, setEmail] = useState<string>('')
  const [password, setPassword] = useState<string>('')
  const [status, setStatus] = useState<status | null>({ message: '', isSuccess: false })
  const loginRef = useRef(null)
  const router = useRouter()

  useEffect(() => {
    loginRef.current.focus()
  }, [])

  useEffect(() => {
    if (status.message) {
      let c = 0
      setTimeout(() => {
        console.log('bingo timer!', c)
        c++
      }, 10000)
    }
  }, [status, status.message])

  const handleOnSubmit = async (event) => {
    event.preventDefault()
    
    if (!email || !password) return setStatus({ message: 'please provide required fields.' })

    const { error } = await signIn('credentials', {
      email,
      password,
      redirect: false
    })

    if (!error) {
      router.push('/')
      router.refresh()
    }

    return setStatus({ message: error })
  }

  return (
    <form onSubmit={handleOnSubmit} className="w-[20rem] m-8 flex flex-col gap-y-4">
      {status && <h4 className={`${status.isSuccess ? 'text-[green]' : 'text-[red]'}`}>{status.message}</h4>}
      <p>account email*</p>
      <input ref={loginRef} className={inputStyles} value={email} onChange={event => setEmail(event.target.value)} />
      <p>password*</p>
      <input type="password" className={inputStyles} value={password} onChange={event => setPassword(event.target.value)} />
      <button className="self-end border border-solid px-4" type="submit">login</button>
    </form>  )
}