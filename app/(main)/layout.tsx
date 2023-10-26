import { getServerSession } from 'next-auth'
import Link from 'next/link'
import LoginButton from '@/app/(main)/_components/login-button'

type HeaderLayoutProps = {
  children: React.ReactNode
}

export default async function HeaderLayout(props: HeaderLayoutProps) {
  const { children } = props
  const session = await getServerSession()

  return (
    <>
      <div className="bg-[#eee] p-2 flex gap-x-8">
        <Link href="/">home</Link>
        <Link href="/builder">builder</Link>
        <Link href="/items">items</Link>
        <Link href="/mobs">mobs</Link>
        <Link href="/quests">quests</Link>
        <Link href="/articles">articles</Link>
        <Link href="/dashboard">dashboard</Link>
        <LoginButton />
      </div>
      {children}
    </>
  )
}