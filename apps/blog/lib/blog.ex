defmodule Blog do
  alias Blog.{Repo, Article}

  @repo Repo

  def new_blog(blog \\ %{}), do: Article.changeset(%Article{}, blog)

  def list_articles do
    @repo.all(Article)
  end

  def get_article!(id) do
    @repo.get!(Article, id)
  end

  def get_article_by(attrs) do
    @repo.get_by(Article, attrs)
  end

  def insert_article(attrs) do
    IO.inspect(attrs)

    %Article{}
    |> Article.changeset(
      Map.merge(attrs, %{is_live: false, is_reviewed: false, is_taken_down: false})
    )
    |> @repo.insert()
  end
end
