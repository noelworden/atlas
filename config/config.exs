# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :atlas,
  ecto_repos: [Atlas.Repo]

# Configures the endpoint
config :atlas, AtlasWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ucKLyrBDlofY1ugaxA8IFeG8dyH7Tji9mSupkh1uoHEPXjv7T7u8qhqDhurPoaCn",
  render_errors: [view: AtlasWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Atlas.PubSub,
  live_view: [signing_salt: "+uzSVLvn"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
