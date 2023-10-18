
import Image from 'next/image'
import prisma from '@/lib/prisma'

export default async function Home() {
  const accounts = await prisma.account.findMany()

  return (
    <main>
      main page
    </main>
  )
}
