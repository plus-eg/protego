defmodule Protego do
  @moduledoc """
  Protego is an authentication library for Elixir/Phoenix. Although adding authentication
  with guardian and uberauth is simple, the goal is to reduce the boilerplate code
  that needs to be written.

  """
  def router do
    quote do
      import Protego.Router, only: [protego_for: 1]
    end
  end

  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
