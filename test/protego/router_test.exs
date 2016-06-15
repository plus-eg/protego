defmodule Protego.RouterTest do
  use ExUnit.Case, async: true
  doctest Protego.Router

  test "defines the macro protego_for" do
    assert Keyword.has_key?(Protego.Router.__info__(:macros), :protego_for),
      "It didn't define the protego_for"
  end

  test "sets protego config per user resource based on the enabled modules" do
    defmodule User do
    end

    defmodule UserAccount do
    end
    
    defmodule Router do
      use Protego, :router
      protego_for User, :authenticatable
      protego_for UserAccount, :authenticatable
    end

    assert Application.get_env(:protego, :user) == [modules: :authenticatable], "Didn't properly set the configuration"
    assert Application.get_env(:protego, :user_account) == [modules: :authenticatable], "Didn't properly set the configuration"

  end

end
