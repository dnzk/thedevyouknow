defmodule Thedevyouknow.Repo.Migrations.AddSlugToBlog do
  use Ecto.Migration

  def change do
    alter table("blogs") do
      add :slug, :string
    end
  end
end
