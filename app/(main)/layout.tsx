import Link from 'next/link'
import { ROUTES } from '@/app/_lib/constants'
import { getServerSession } from 'next-auth'
import { authOptions } from '@/app/api/auth/[...nextauth]/route'
import LoginButton from '@/app/(main)/_components/login-button'

type HeaderLayoutProps = {
  children: React.ReactNode
}

export default async function HeaderLayout({ children }: HeaderLayoutProps) {
  const session = await getServerSession(authOptions)

  return (
    <>
      <div className="bg-[#eee] p-2 flex gap-x-8">
        <Link href={ROUTES.HOME}>home</Link>
        <Link href={ROUTES.BUILDER}>builder</Link>
        <Link href={ROUTES.ITEMS}>items</Link>
        <Link href={ROUTES.MOBS}>mobs</Link>
        <Link href={ROUTES.QUESTS}>quests</Link>
        <Link href={ROUTES.ARTICLES}>articles</Link>
        <Link href={ROUTES.DASHBOARD}>dashboard</Link>
        <LoginButton session={session} />
      </div>
      {children}
    </>
  )
}