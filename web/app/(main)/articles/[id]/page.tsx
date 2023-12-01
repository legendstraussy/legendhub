type ArticlePageProps = {
  params: {
    id: string
  }
}

export default function ArticlePage({ params }: ArticlePageProps) {
  const { id } = params
  const articleId = parseInt(id)

  return (
    <div>article {articleId} page</div>
  )
}