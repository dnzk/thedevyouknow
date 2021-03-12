use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :admin_web, AdminWeb.Endpoint,
  http: [port: 4002],
  server: false

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :blog_web, BlogWeb.Endpoint,
  http: [port: 4002],
  server: false
