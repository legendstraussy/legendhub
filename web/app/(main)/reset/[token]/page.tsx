import { redirect } from "next/navigation";
import { validateResetToken } from '@/app/_services/register-service'
import { ROUTES } from '@/app/_lib/constants'
import { ServiceResponse } from '@/app/_types/service_response'
import ResetForm from '@/app/(main)/reset/[token]/_components/reset-form'

export default async function ResetPage({ params }) {
  const { token } = params

  const response: ServiceResponse = await validateResetToken({ token })

  if (response.error) redirect(ROUTES.LOGIN)

  return (
    <main>
      <h3>reset password!</h3>
      <ResetForm token={token} />
    </main>
  )
}