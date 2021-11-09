defmodule Thedevyouknow.Posts.Blog do
  use Ecto.Schema
  import Ecto.Changeset
  alias Thedevyouknow.Posts.Blog

  schema "blogs" do
    field(:title, :string)
    field(:excerpt, :string)
    field(:body, :string)
    field(:is_reviewed, :boolean, default: false)
    field(:is_published, :boolean, default: false)
    field(:slug, :string)

    many_to_many :tags, Thedevyouknow.Posts.Tag, join_through: "blogs_tags"

    timestamps()
  end

  def new_changeset(%Blog{} = blog, attrs) do
    blog
    |> cast(attrs, [:title, :slug, :excerpt, :body])
    |> validate_required([:title, :body])
    |> unique_constraint(:slug)
    |> put_change(:is_reviewed, false)
    |> put_change(:is_published, false)
  end

  @doc false
  def changeset(%Blog{} = blog, attrs) do
    blog
    |> cast(attrs, [:title, :slug, :excerpt, :body, :is_reviewed, :is_published])
    |> validate_required([:title, :body])
  end
end
