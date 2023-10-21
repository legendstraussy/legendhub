
import Image from 'next/image'
import prisma from '@/app/_lib/prisma'

export default async function Home() {
  const accounts = await prisma.account.findMany()

  return (
    <main>
      main page
    </main>
  )
}
