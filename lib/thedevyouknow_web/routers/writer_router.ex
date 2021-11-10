defmodule ThedevyouknowWeb.WriterRouter do
  use ThedevyouknowWeb, :router

  # Import authentication plugs
  import ThedevyouknowWeb.UserAuth

  def require_writer_access(
        %{:assigns => %{:current_user => current_user}} = conn,
        _opts
      ) do
    with false <- is_nil(current_user),
         "writer" <- Map.get(current_user, :role) do
      conn
    else
      # _ -> halt(conn)
      _ -> redirect(conn, to: "/users/log_in")
    end
  end

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {ThedevyouknowWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :fetch_current_user
  end

  scope "/", ThedevyouknowWeb do
    pipe_through [:browser, :require_authenticated_user, :require_writer_access]

    get "/", BlogController, :writer_index

    resources "/blogs", BlogController, only: [:new, :create] do
      get "/review", BlogController, :review, as: :review
      put "/review", BlogController, :mark_as_reviewed, as: :review
      put "/publish", BlogController, :mark_as_published, as: :review
    end
  end

  ## Authentication routes

  scope "/", ThedevyouknowWeb do
    pipe_through [:browser, :redirect_if_user_is_authenticated]

    get "/users/register", UserRegistrationController, :new
    post "/users/register", UserRegistrationController, :create_writer
    get "/users/log_in", UserSessionController, :new
    post "/users/log_in", UserSessionController, :create
    get "/users/reset_password", UserResetPasswordController, :new
    post "/users/reset_password", UserResetPasswordController, :create
    get "/users/reset_password/:token", UserResetPasswordController, :edit
    put "/users/reset_password/:token", UserResetPasswordController, :update
  end

  scope "/", ThedevyouknowWeb do
    pipe_through [:browser, :require_authenticated_user]

    get "/users/settings", UserSettingsController, :edit
    put "/users/settings", UserSettingsController, :update
    get "/users/settings/confirm_email/:token", UserSettingsController, :confirm_email
  end

  scope "/", ThedevyouknowWeb do
    pipe_through [:browser]

    delete "/users/log_out", UserSessionController, :delete
    get "/users/confirm", UserConfirmationController, :new
    post "/users/confirm", UserConfirmationController, :create
    get "/users/confirm/:token", UserConfirmationController, :edit
    post "/users/confirm/:token", UserConfirmationController, :update
  end
end
