defmodule Protego.Router do
  defmacro protego_for(resource) do
    quote do
      IO.inspect(unquote(resource))
    end
  end

  defmacro __using__(_) do
    quote do
      import unquote(__MODULE__), only: [protego_for: 1]
    end
  end
end
