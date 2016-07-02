# Protego
[![Build Status](https://travis-ci.org/plus-eg/protego.svg?branch=master)](https://travis-ci.org/plus-eg/protego)

Flexible authentication solution for Elixir/Phoenix with Guardian. it:

* Is inspired by Rails Devise;
* Is Plug based;

Protego is modular, so you can use:

* Authenticatable: Hangles authenticating a user via password stored in the database.
* Registrable: Handles the signup process of a user.

## Getting Started 
  
Add protego to your list of dependencies in `mix.exs`:

    def deps do
      [{:protego, "~> 0.0.1"}]
    end

Configure Guardian

    config :guardian, Guardian,
    issuer: "MyApp.#{Mix.env}",
    ttl: {1, :days},
    verify_issuer: true,
    serializer: Protego.Auth.GuardianSerializer,
    secret_key: <secret_key_base>,

Generate the user resource

    mix phoenix.gen.model User users name:string email:string password_hash:string

Configure your routes

    defmodule MyApp.Router do
      use MyApp.Web, :router
      use Protego, :router

      scope "/", MyApp do
        pipe_through :browser

      end
      scope "/users", Protego do
        pipe_through :browser

        protego_for MyApp.Resource, :authenticatable #ex: My.User, :authenticatable
      end
    end
	
This will generate a new scope "/users" with the new defined routes.

## Authenticatable

Enable Module

    protego_for MyApp.Resource, :authenticatable #ex: My.User, :authenticatable - allowed modules are authenticatable

Add required schema fields

    field :username, :string
    field :password, :string, virtual: true
    field :password_hash, :string

