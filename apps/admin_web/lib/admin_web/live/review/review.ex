defmodule AdminWeb.ArticleLive.Review do
  use AdminWeb, :live_view
  alias Blog
  alias Hypermarkdown

  @impl true
  def mount(_params, _session, socket) do
    articles = Blog.list_articles()
    {:ok, assign(socket, %{articles: articles})}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :review, %{"id" => id}) do
    article = Blog.get_article!(id)

    socket
    |> assign(:page_title, "Review Article")
    |> assign(:article, %{article | content: Hypermarkdown.parse(:md_to_html, article.content)})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Review")
    |> assign(:article, nil)
  end

  @impl true
  def handle_event("publish", %{"id" => id}, socket) do
    # TODO: do proper handling here
    Blog.publish_article(String.to_integer(id))
    {:noreply, socket}
  end
end
