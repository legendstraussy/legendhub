import { NextRequest, NextResponse } from 'next/server'
import { ERROR_MESSAGES } from '@/app/_lib/constants'
import { resetPassword } from '@/app/_services/register-service'
import { ServiceResponse } from '@/app/_types/service_response'

export async function POST(req: NextRequest) {
  try {
    const { password, token } = await req.json()
    
    const response: ServiceResponse = await resetPassword({ password, token })

    if (response.error === ERROR_MESSAGES.ALREADY_EXISTS) return NextResponse.json(response, { status: 409 })

    return NextResponse.json(response, { status: 201 })
  } catch (errorResponse) {
    return NextResponse.json(errorResponse, { status: 500 })
  }
}