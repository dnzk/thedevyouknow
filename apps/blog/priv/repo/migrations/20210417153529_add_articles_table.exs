defmodule Blog.Repo.Migrations.AddArticlesTable do
  use Ecto.Migration

  def change do
    create table("articles") do
      add :title, :string
      add :excerpt, :string
      add :content, :string
      add :is_live, :boolean
      add :is_reviewed, :boolean
      add :is_taken_down, :boolean

      timestamps()
    end
  end
end
