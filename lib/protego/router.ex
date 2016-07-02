defmodule Protego.Router do
  @moduledoc """
  The Router defines routes depending on the enabled modules.

  It initializes the protego app configuration for given resources 
  using the `Protego.Router.protego_for/2` macro
  
  ## Available modules
  * authenticatable
  """

  @doc """
  Enables protego for a specific resource with selected modules.

  ## Examples

  ```elixir
  protego_for App.User, :authenticatable # Enables protego for App.User with authenticatable module
  ```
  """
  defmacro protego_for(resource, modules \\ []) do
    quote do
      unquote(resource)
      |> get_resource_name
      |> generate_config(unquote(modules))
      |> persist_config

      generate_routes()
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
    Mix.Config.merge(Application.get_all_env(:protego), config) |> Mix.Config.persist
  end

  # Defines routes for the enables modules
  @doc false
  defmacro generate_routes do
    quote do
      get "/", Controllers.UserController, :index, as: :users
    end
  end
end
