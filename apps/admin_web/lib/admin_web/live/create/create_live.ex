defmodule AdminWeb.CreateLive do
  use AdminWeb, :live_view
  alias Blog
  alias Hypermarkdown

  @impl true
  def mount(_params, _session, socket) do
    blog = Blog.new_blog()
    {:ok, assign(socket, %{article: blog, preview: %{title: "", content: "", excerpt: ""}})}
  end

  @impl true
  def handle_event(
        "update",
        %{
          "article" =>
            %{
              "content" => content,
              "excerpt" => excerpt,
              "title" => title
            } = article
        },
        socket
      ) do
    preview = %{
      content: Hypermarkdown.parse(:md_to_html, content),
      excerpt: excerpt,
      title: title
    }

    {:noreply, assign(socket, %{preview: preview, article: Blog.new_blog(article)})}
  end

  @impl true
  def handle_event("save", %{"article" => article}, socket) do
    article = for {key, val} <- article, into: %{}, do: {String.to_atom(key), val}

    case Blog.insert_article(article) do
      {:ok, _} ->
        {:noreply, push_redirect(socket, to: "/review")}

      {:error, changeset} ->
        {:noreply, assign(socket, %{article: changeset})}
    end
  end
end
