defmodule Thedevyouknow.PostsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Thedevyouknow.Posts` context.
  """

  @doc """
  Generate a blog.
  """
  def blog_fixture(attrs \\ %{}) do
    {:ok, blog} =
      attrs
      |> Enum.into(%{
        title: "Some title",
        excerpt: "Some excerpt...",
        body: "<p>The content of this blog</p>"
      })
      |> Thedevyouknow.Posts.create_blog()

    blog
  end

  @doc """
  Generate a tag.
  """
  def tag_fixture(attrs \\ %{}) do
    {:ok, tag} =
      attrs
      |> Enum.into(%{
        name: "some name",
        slug: "some slug"
      })
      |> Thedevyouknow.Posts.create_tag()

    tag
  end
end
