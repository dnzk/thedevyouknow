defmodule Blog do
  alias Blog.{Repo, Article}

  @repo Repo

  def list_articles do
    @repo.all(Article)
  end

  def get_article!(id) do
    @repo.get!(Article, id)
  end

  def get_article_by(attrs) do
    @repo.get_by(Article, attrs)
  end
end
