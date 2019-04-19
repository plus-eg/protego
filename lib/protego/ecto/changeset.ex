defmodule Protego.Ecto.Changeset do
  @moduledoc """
  The module adds some helper functions required during registration / authentication of users and authorization of resources.
  """
  @doc """
  Converts the typical changeset nested errors map to a flat list of errors.

  ## Example
  iex> Protego.Ecto.Changeset.error_list_from(%{errors: [email: {"has already been taken", []}]})
  ["email has already been taken"]
  """
  def error_list_from(changeset) do
    changeset.errors
    |> Enum.reduce([], fn {field_name, {error_message, _}}, errors ->
      ["#{field_name} #{error_message}"] ++ errors
    end)
  end

  @doc"""
  Puts the password hash to the changeset

  ## Example
  iex>%Ecto.Changeset{valid?: true}
  ...>|> Protego.Ecto.Changeset.put_password_hash
  %Ecto.Changeset{valid?: true}
  """
  def put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true} -> changeset
      _ -> changeset
    end
  end
end
