defmodule Thedevyouknow.Repo.Migrations.CreateBlogsTags do
  use Ecto.Migration

  def change do
    create table(:blogs_tags) do
      add :blog_id, references(:blogs)
      add :tag_id, references(:tags)
    end

    create unique_index(:blogs_tags, [:blog_id, :tag_id])
  end
end
