type QuestPageProps = {
  params: {
    id: string
  }
}

export default function QuestPage({ params }: QuestPageProps) {
  const { id } = params
  const questId = parseInt(id)

  return (
    <div>quest {questId} page</div>
  )
}