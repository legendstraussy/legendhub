import { NextRequest, NextResponse } from 'next/server'
import { registerUser } from '@/app/_services/register-service'

export async function POST(req: NextRequest) {
  try {
    const { email, password } = await req.json()
    
    await registerUser({ email, password })

    return NextResponse.json({ message: 'Account successfully registered!' }, { status: 201 })
  } catch (error) {
    if (error) return NextResponse.json({ message: error }, { status: 409 })

    return NextResponse.json(
      { message: 'An error occurred while registering the user.' },
      { status: 500 }
    )
  }
}