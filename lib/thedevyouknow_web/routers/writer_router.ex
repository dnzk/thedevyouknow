defmodule ThedevyouknowWeb.WriterRouter do
  use ThedevyouknowWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {ThedevyouknowWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    # TODO: Add require_writer_access_plug
  end

  scope "/", ThedevyouknowWeb do
    pipe_through :browser

    get "/", WriterController, :index
    resources "/blogs", WriterController, only: [:new, :create]
  end
end
