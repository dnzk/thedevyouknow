defmodule ThedevyouknowWeb.PageController do
  use ThedevyouknowWeb, :controller

  def index(conn, _params) do
    render(conn, "home.html")
  end

  def about(conn, _params) do
    render(conn, "about.html")
  end
end
