defmodule Blog.Application do
  use Application

  def start(_type, _args) do
    children = [
      {Blog.Repo, []}
    ]
    opts = [strategy: :one_for_one, name: Blog.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
