defmodule Thedevyouknow.Posts.Blog do
  use Ecto.Schema
  import Ecto.Changeset
  alias Thedevyouknow.Posts.Blog
  alias String

  schema "blogs" do
    field(:title, :string)
    field(:excerpt, :string)
    field(:body, :string)

    timestamps()
  end

  @doc false
  def changeset(%Blog{} = blog, attrs) do
    blog
    |> cast(attrs, [:title, :excerpt, :body])
    |> validate_required([:title, :body])
  end
end
