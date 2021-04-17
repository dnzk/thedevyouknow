defmodule Blog.Repo do
  alias Blog.Article

  @articles [
    %Article{
      id: 1,
      title: "How to make elixir work with javascript",
      excerpt: "Elixir can work with javascript if you have the patience",
      tags: ["elixir", "javascript", "interop"],
      content: """
      ## What

      Ok here's some things to consider when writing code.
      First of all, try not to.
      Now beyond that, if you really really have to, here's more.
      """
    }
  ]

  def all(Article), do: @articles

  def get!(Article, id) do
    Enum.find(@articles, fn (article) -> article.id == id end)
  end

  def get_by(Article, map) do
    Enum.find(@articles, fn (article) ->
      Enum.all?(Map.keys(map), fn (key) ->
        Map.get(article, key) == map[key]
      end)
    end)
  end
end
