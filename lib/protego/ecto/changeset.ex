defmodule Protego.Ecto.Changeset do
  import Ecto.Changeset

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

  @doc """
  Puts the password hash in the changeset

  ## Example
  %Ecto.Changeset{changes: %{password: "123456"}}
  |> Protego.Ecto.Changeset.put_password_hash
  %Ecto.Changeset{changes: %{password: "12345"}}
  """
  def put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{changes: %{password: password}} ->
        put_change(changeset, :password_hash, Argon2.hash_pwd_salt(password))

      _ ->
        changeset
    end
  end
end
