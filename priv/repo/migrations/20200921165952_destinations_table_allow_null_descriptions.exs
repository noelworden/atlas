defmodule Atlas.Repo.Migrations.DestinationsTableAllowNullDescriptions do
  use Ecto.Migration

  def change do
    alter table(:destinations) do
      modify :description, :text, null: true
    end
  end
end
