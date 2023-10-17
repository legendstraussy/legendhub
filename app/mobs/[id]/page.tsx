type MobPageProps = {
  params: {
    id: string
  }
}

export default function MobPage({ params }: MobPageProps) {
  const { id } = params
  const mobId = parseInt(id)

  return (
    <div>mob {mobId} page</div>
  )
}