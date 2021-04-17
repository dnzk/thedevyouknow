defmodule AdminWeb.CreateLive do
  use AdminWeb, :live_view
  alias Blog
  alias Hypermarkdown

  @impl true
  def mount(_params, _session, socket) do
    blog = Blog.get_article!(1)
    blog = %{blog | content: Hypermarkdown.parse(:md_to_html, blog.content)}
    {:ok, assign(socket, %{preview: blog})}
  end

  @impl true
  def handle_event("title-update", %{"value" => title}, socket) do
    preview = %{socket.assigns.preview | title: title}
    {:noreply, assign(socket, %{preview: preview})}
  end

  @impl true
  def handle_event("content-update", %{"value" => content}, socket) do
    preview = %{socket.assigns.preview | content: Hypermarkdown.parse(:md_to_html, content)}
    {:noreply, assign(socket, %{preview: preview})}
  end

  @impl true
  def handle_event("excerpt-update", %{"value" => excerpt}, socket) do
    preview = %{socket.assigns.preview | excerpt: excerpt}
    {:noreply, assign(socket, %{preview: preview})}
  end

  @impl true
  def handle_event("tags-update", %{"value" => tags}, socket) do
    preview = %{socket.assigns.preview | tags: String.split(tags, ",")}
    {:noreply, assign(socket, %{preview: preview})}
  end

  @impl true
  def handle_event("save", _, socket) do
    {:noreply, socket}
  end
end
