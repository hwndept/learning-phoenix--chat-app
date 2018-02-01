# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :learning_phoenix_chat,
  ecto_repos: [LearningPhoenixChat.Repo]

# Configures the endpoint
config :learning_phoenix_chat, LearningPhoenixChatWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "tdorobWq19AHIBVj5KRr9PhIu+twVsrAxsX/9fMoLWLNeHUrN72yylexvTu57pcU",
  render_errors: [view: LearningPhoenixChatWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: LearningPhoenixChat.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
