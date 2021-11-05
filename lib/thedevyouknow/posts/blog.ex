defmodule Thedevyouknow.Posts.Blog do
  use Ecto.Schema
  import Ecto.Changeset
  alias Thedevyouknow.Posts.Blog

  schema "blogs" do
    field(:title, :string)
    field(:excerpt, :string)
    field(:body, :string)

    many_to_many :tags, Thedevyouknow.Posts.Tag, join_through: "blogs_tags"

    timestamps()
  end

  @doc false
  def changeset(%Blog{} = blog, attrs) do
    blog
    |> cast(attrs, [:title, :excerpt, :body])
    |> validate_required([:title, :body])
  end
end
