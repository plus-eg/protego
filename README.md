# Protego

## Protego is still in early, unstable alpha state. If you want a production ready 
library please check [pow](https://github.com/danschultzer/pow)

Flexible authentication solution for Elixir/Phoenix with Guardian. it:
* Is inspired by Rails Devise;
* Is Plug based;

## Getting Started

1.Add protego to your list of dependencies in `mix.exs`:

    def deps do
      [{:protego, "~> 0.1.0"}]
    end
2. Configure [UberAuth](https://github.com/ueberauth/ueberauth) Strategies
```
config :ueberauth, Ueberauth,
  providers: [
    identity: {Ueberauth.Strategy.Identity, [
      callback_methods: ["POST"]
    ]}
  ]
```
3. Generate a sessions controller
```
mix phx.gen.html Users Session sessoins username password
```
