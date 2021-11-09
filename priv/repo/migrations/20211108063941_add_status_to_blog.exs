defmodule Thedevyouknow.Repo.Migrations.AddStatusToBlog do
  use Ecto.Migration

  def change do
    alter table("blogs") do
      add :is_reviewed, :boolean
      add :is_published, :boolean
    end
  end
end
