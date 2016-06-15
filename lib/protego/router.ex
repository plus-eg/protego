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

      protego_for App.User, :authenticatable # Enables protego for App.User with the authenticatable module
  """
  defmacro protego_for(resource, modules \\ []) do
    quote do

      resource_name = Protego.Router.module_name(unquote(resource))

      resource_config = Keyword.put_new([], String.to_atom(resource_name), [modules: unquote(modules)])
      updated_config = Keyword.put_new([], :protego, resource_config)

      Mix.Config.merge(Application.get_all_env(:protego), updated_config)
      |> Mix.Config.persist
    end
  end

  @doc """
  returns the module name extracted from full module name in underscore format

  ## Examples
  
      iex> Protego.Router.module_name(Protego.Router)
      "router"
      iex> Protego.Router.module_name(Protego.RouterTest)
      "router_test"
      iex> Protego.Router.module_name(Protego)
      "protego"
  """
  def module_name(module) do
    String.split("#{module}", ".")
    |> List.last
    |> Macro.underscore 
  end
end
