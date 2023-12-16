import { getServerSession } from 'next-auth'
import { authOptions } from '@/app/api/auth/[...nextauth]/auth'

export default async function ArticlesPage() {
  const session = await getServerSession(authOptions)

  return (
    <div>
      <h3></h3>articles page
      {session?.user?.role} 
    </div>
  )
}