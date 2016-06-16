defmodule Protego.RouterTest do
  use ExUnit.Case, async: true
  use RouterHelper
  doctest Protego.Router

  defmodule User do
  end

  defmodule Router do
    use Phoenix.Router
    use Protego, :router

    scope "/users", Protego do
      protego_for User, :authenticatable
      protego_for UserAccount, :authenticatable
    end
  end

  setup do
    Logger.disable(self())
    :ok
  end

  test "defines the macro protego_for" do
    assert Keyword.has_key?(Protego.Router.__info__(:macros), :protego_for)
  end

  test "sets protego config per user resource based on the enabled modules" do
    defmodule UserAccount do
    end

    assert Application.get_env(:protego, :user) == [modules: :authenticatable]
    assert Application.get_env(:protego, :user_account) == [modules: :authenticatable]
  end

  test "generates routes depending on the enabled modules" do

    conn = call(Router, :get, "/users")
    assert conn.status == 200
    assert conn.resp_body == "users index"
  end
end
