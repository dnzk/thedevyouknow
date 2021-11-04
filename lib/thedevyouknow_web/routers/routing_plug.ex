defmodule ThedevyouknowWeb.Plug.Routing do
  @moduledoc """
  This plug routes to router based on
  the hostname
  """

  alias Plug.Conn
  alias ThedevyouknowWeb.{Router, WriterRouter}

  def init(default), do: default

  def call(%Conn{:host => host} = conn, options) do
    if host =~ ~r/writer.*\.thedevyouknow\.com/ do
      WriterRouter.call(conn, options)
    else
      Router.call(conn, options)
    end
  end
end
