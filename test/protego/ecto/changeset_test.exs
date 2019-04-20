defmodule Protego.Ecto.ChangesetTest do
  use ExUnit.Case, async: true
  alias Protego.Test.User
  import Protego.Ecto.Changeset

  doctest Protego.Ecto.Changeset

  test "adds hash to the changeset" do
    password = "123456"
    changeset_with_hash =
      User.changeset(%User{}, %{password: password})
      |> put_password_hash

    {password_decoded?, _} = Argon2.check_pass(changeset_with_hash.changes, password)
    assert password_decoded? == :ok, "Password hasing failed"
  end
end
