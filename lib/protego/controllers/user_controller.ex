defmodule Protego.Controllers.UserController do
  @moduledoc false
  use Phoenix.Controller

  plug :put_layout, false

  def index(conn, _params) do
    render conn, Protego.Views.UserView, "index.html"
  end
end
