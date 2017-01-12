defmodule Protego.Support.Module do
  @moduledoc """
  Conveniences for handling modules
  """

  @doc """
  converts `module` name to `atom`

  ## Examples

    iex> Protego.Support.Module.to_atom(Protego.Support)
    :support
  """
  def to_atom(module) do
    module
    |> Atom.to_string
    |> String.split(".")
    |> List.last
    |> Macro.underscore
    |> String.to_atom
  end
end
