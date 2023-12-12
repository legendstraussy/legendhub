import { NextRequest, NextResponse } from 'next/server'
import { resetPasswordRequest } from '@/app/_services/register-service'
import { ServiceResponse } from '@/app/_types/service_response'

export async function POST(req: NextRequest) {
  try {
    const { email } = await req.json()
    
    const response: ServiceResponse = await resetPasswordRequest({ email })

    return NextResponse.json(response, { status: 201 })
  } catch (errorResponse) {
    return NextResponse.json(errorResponse, { status: 500 })
  }
}