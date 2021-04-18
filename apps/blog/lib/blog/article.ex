defmodule Blog.Article do
  # defstruct [:id, :title, :excerpt, :tags, :content]
  use Ecto.Schema
  import Ecto.Changeset

  schema "articles" do
    field(:title, :string)
    field(:excerpt, :string)
    field(:content, :string)
    field(:is_live, :boolean)
    field(:is_reviewed, :boolean)
    field(:is_taken_down, :boolean)

    timestamps()
  end

  def changeset(blog, params \\ %{}) do
    blog
    |> cast(params, [:title, :excerpt, :content, :is_live, :is_reviewed, :is_taken_down])
    |> validate_required([:title, :content, :is_live, :is_reviewed, :is_taken_down])
  end
end
