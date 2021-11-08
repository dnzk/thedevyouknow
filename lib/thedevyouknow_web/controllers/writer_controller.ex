defmodule ThedevyouknowWeb.WriterController do
  use ThedevyouknowWeb, :controller
  alias Thedevyouknow.Posts

  def index(conn, _params) do
    blogs = Posts.list_blogs()
    render(conn, "index.html", blogs: blogs)
  end

  def new(conn, _params) do
    changeset = Posts.change_blog(%Posts.Blog{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"blog" => blog}) do
    case Posts.create_blog(blog) do
      {:ok, _blog} ->
        conn
        |> put_flash(:success, "Blog was created.")
        |> redirect(to: "/")

      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
