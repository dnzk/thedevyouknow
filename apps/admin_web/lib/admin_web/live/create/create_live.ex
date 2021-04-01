defmodule AdminWeb.CreateLive do
  use AdminWeb, :live_view
  alias Hypermarkdown

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, %{preview: %{title: "", content: ""}})}
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
end
