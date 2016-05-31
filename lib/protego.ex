defmodule Protego do
  def router do
    quote do
      import Protego.Router,  only: [protego_for: 1]
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
