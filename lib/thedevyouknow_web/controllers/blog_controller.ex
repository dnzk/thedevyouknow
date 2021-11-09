defmodule ThedevyouknowWeb.BlogController do
  use ThedevyouknowWeb, :controller
  alias Thedevyouknow.Posts

  def index(conn, _params) do
    blogs = Posts.list_blogs()
    render(conn, "index.html", blogs: blogs)
  end

  def writer_index(conn, _params) do
    # TODO: get blogs by statuses
    # and display them in order
    blogs = Posts.list_blogs()
    render(conn, "writer_index.html", blogs: blogs)
  end

  def view(conn, %{"blog_slug" => blog_slug}) do
    blog = Posts.get_blog_by_slug!(blog_slug)
    render(conn, "view.html", blog: blog)
  end

  def new(conn, _params) do
    changeset = Posts.change_blog(%Posts.Blog{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"blog" => blog}) do
    case Posts.create_blog(blog) do
      {:ok, blog} ->
        conn
        |> put_flash(:success, "Blog was created.")
        |> redirect(to: WriterRoutes.blog_review_path(conn, :review, blog.id))

      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def review(conn, %{"blog_id" => blog_id}) do
    blog = Posts.get_blog!(blog_id)
    render(conn, "review.html", blog: blog)
  end

  def mark_as_reviewed(conn, %{"blog_id" => blog_id}) do
    blog = Posts.get_blog!(blog_id)

    case Posts.update_blog(blog, %{"is_reviewed" => true}) do
      {:ok, _blog} -> redirect(conn, to: WriterRoutes.blog_path(conn, :writer_index))
      {:error, _error} -> render(conn, "review.html", blog: blog, error: "There was an error")
    end
  end
end
