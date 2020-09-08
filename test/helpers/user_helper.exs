defmodule Protego.Test.User do
  use Ecto.Schema
  require Protego.Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    Protego.Ecto.Schema.password_fields()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:password])
  end
end
