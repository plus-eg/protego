defmodule Protego.Controllers.UserController do
  use Phoenix.Controller

  #plug :put_layout, false #{Plus.LayoutView, "app.html"}
  plug :put_layout, false

  def index(conn, _params) do
    render conn, Protego.Views.UserView, "index.html"
  end
end
