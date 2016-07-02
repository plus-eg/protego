defmodule Protego.RouterTest do
  use ExUnit.Case, async: true
  use RouterHelper
  doctest Protego.Router

  setup do
    Logger.disable(self())
    :ok
  end

  ## Models

  defmodule User do
  end

  defmodule UserAccount do
  end

  ## Router

  defmodule Router do
    use Phoenix.Router
    use Protego, :router

    scope "/users", Protego do
      protego_for User, [:registrable, :authenticatable]
    end

    scope "/user_accounts", Protego do
      protego_for UserAccount, :authenticatable
    end
  end

  test "use defines protego_for macro" do
    assert Keyword.has_key?(Protego.Router.__info__(:macros), :protego_for)
  end

  describe "protego_for" do
    test "configures enabled modules for a resource" do
      assert Application.get_env(:protego, :user) == [modules: [:registrable, :authenticatable]]
      assert Application.get_env(:protego, :user_account) == [modules: :authenticatable]
    end

    test "defines routes for registerable module"  do
      IO.inspect Application.get_all_env(:protego)
      Application.put_env(:protego, :registrable_user, [modules: [:registrable]])
      IO.inspect Application.get_all_env(:protego)
      conn = call(Router, :get, "/users")
      assert conn.status == 200
    end
  end
end
