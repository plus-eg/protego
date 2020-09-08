defmodule Protego.RouterTest do
  use ExUnit.Case
  doctest Protego

  test "defines the macro protego_for" do
    assert Keyword.has_key?(Protego.Router.__info__(:macros), :protego_for),
           "It didn't define the protego_for"
  end
end
