import RegisterForm from '@/app/(main)/register/_components/register-form'
import { headers } from 'next/headers'

const headersList = headers()

export default async function RegisterPage() {

  return (
    <main>
      <h3>Register!</h3> 
      <RegisterForm />
    </main>
  )
}