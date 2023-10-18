import { NextResponse } from 'next/server'
import bcrypt from "bcrypt"
import prisma from '@/lib/prisma'

export async function POST(req) {
  try {
    const { email, password } = await req.json()
    const hashedPassword = await bcrypt.hash(password, 10)
    await prisma.account.create({ data: {
       email,
    }})

    return NextResponse.json({ message: "User registered." }, { status: 201 });
  } catch (error) {
    return NextResponse.json(
      { message: "An error occurred while registering the user." },
      { status: 500 }
    )
  }
}