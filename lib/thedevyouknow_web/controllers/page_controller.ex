defmodule ThedevyouknowWeb.PageController do
  use ThedevyouknowWeb, :controller

  def index(conn, _params) do
    render(conn, "home.html")
  end
end
