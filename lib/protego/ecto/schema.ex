defmodule Protego.Ecto.Schema do
  @doc"""
  Adds the passwords fields to the ecto schema
  """
  defmacro password_fields do
    quote do
      field(:password, :string, virtual: true)
      field(:password_hash, :string)
    end
  end
end
