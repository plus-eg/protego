# Protego
Flexible authentication solution for Elixir/Phoenix with Guardian. it:
* Is heavily inspired by Rails Devise;
* Is Plug based;


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add protego to your list of dependencies in `mix.exs`:

        def deps do
          [{:protego, "~> 0.0.1"}]
        end

  2. Ensure protego is started before your application:

        def application do
          [applications: [:protego]]
        end
  
  3. Configure Guardian

        config :guardian, Guardian,
          issuer: "<Application>.#{Mix.env}",
          ttl: {1, :days},
          verify_issuer: true,
          serializer: PhoenixGuardian.GuardianSerializer,
          secret_key: <secret_key_base>,
          hooks: GuardianDb,
          permissions: %{
            default: [
              :read_profile,
              :write_profile,
              :read_token,
              :revoke_token,
            ],
          }
