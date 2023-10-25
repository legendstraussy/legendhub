type ItemPageProps = {
  params: {
    id: string
  }
}

export default function ItemPage({ params }: ItemPageProps) {
  const { id } = params
  const itemId = parseInt(id)

  return (
    <div>item {itemId} page</div>
  )
}