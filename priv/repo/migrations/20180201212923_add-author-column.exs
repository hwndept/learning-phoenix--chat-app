defmodule :"Elixir.ChatApp.Repo.Migrations.Add-author-column" do
  use Ecto.Migration

  def change do
    alter table(:messages) do
      add :author, :string
    end
  end
end
