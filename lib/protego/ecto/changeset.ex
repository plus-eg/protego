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
end
