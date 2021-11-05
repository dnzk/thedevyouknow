defmodule Thedevyouknow.Posts.Tag do
  use Ecto.Schema
  import Ecto.Changeset
  alias Thedevyouknow.Posts.Tag

  schema "tags" do
    field :name, :string
    field :slug, :string

    timestamps()
  end

  @doc false
  def changeset(%Tag{} = tag, attrs) do
    tag
    |> cast(attrs, [:name, :slug])
    |> validate_required([:name, :slug])
  end
end
