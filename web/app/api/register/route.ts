import { NextRequest, NextResponse } from 'next/server'
import { SERVICE_ERRORS } from '@/app/_lib/constants'
import { registerUser } from '@/app/_services/register-service'
import { ServiceResponse } from '@/app/_types/service_response'

export async function POST(req: NextRequest) {
  try {
    const { email, password } = await req.json()
    
    const response: ServiceResponse = await registerUser({ email, password })

    if (response.errorType === SERVICE_ERRORS.ALREADY_EXISTS) return NextResponse.json(response, { status: 409 })

    return NextResponse.json(response, { status: 201 })
  } catch (errorResponse) {
    return NextResponse.json(errorResponse, { status: 500 })
  }
}