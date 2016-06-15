defmodule Protego do
  @moduledoc """
  Flexible authentication solution for Elixir/Phoenix with Guardian.
  """

  def router do
    quote do
      import Protego.Router
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
