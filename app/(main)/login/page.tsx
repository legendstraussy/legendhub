import { getServerSession } from 'next-auth'
import { redirect } from 'next/navigation'
import LoginForm from '@/app/(main)/login/_components/login-form'

export default async function LoginPage() {
  const session = await getServerSession()

  if (session) {
    redirect('/')
  }

  return (
    <div>
      <h3>Login!</h3>
      <LoginForm />
    </div>
  )
}