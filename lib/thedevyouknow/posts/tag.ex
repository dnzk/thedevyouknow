defmodule Thedevyouknow.Posts.Tag do
  use Ecto.Schema
  import Ecto.Changeset
  alias Thedevyouknow.Posts.Tag

  schema "tags" do
    field :name, :string
    field :slug, :string

    many_to_many :blogs, Thedevyouknow.Posts.Blog, join_through: "blogs_tags"

    timestamps()
  end

  @doc false
  def changeset(%Tag{} = tag, attrs) do
    tag
    |> cast(attrs, [:name, :slug])
    |> validate_required([:name, :slug])
  end
end
