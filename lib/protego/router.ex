defmodule Protego.Router do
  @moduledoc """
  Handles routing depending on enabled modules.

  Handles initial configuration of the enabled modules through the `Protego.Router.protego_for/2` macro

  ## Available modules
  * authenticatable
  """

  @doc """
  Enables protego for a specific resource with selected modules.

  ## Examples
  ```elixir
  protego_for App.User, :authenticatable # Enables protego for App.User with the authenticatable module
  ```
  """
  defmacro protego_for(resource, modules \\ []) do
    quote do
      unquote(resource)
      |> get_resource_name
      |> generate_config(unquote(modules))
      |> persist_config
    end
  end

  # Returns resource name from module name
  @doc false
  def get_resource_name(module) do
    String.split("#{module}", ".")
    |> List.last
    |> Macro.underscore
    |> String.to_atom
  end

  # Generate new config for resource
  @doc false
  def generate_config(resource, modules) do
    resource_config = Keyword.put_new([], resource, [modules: modules])
    Keyword.put_new([], :protego, resource_config)
  end

  # Persist config in app protego
  @doc false
  def persist_config(config) do
    Mix.Config.merge(Application.get_all_env(:protego), config)
    |> Mix.Config.persist
  end
end
