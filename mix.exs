defmodule Protego.Mixfile do
  use Mix.Project

  @version "0.1.1"

  def project do
    [
      app: :protego,
      version: @version,
      elixir: "~> 1.7",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      name: "Protego",
      homepage_url: "http://www.pluseg.com",
      description: """
      Flexible authentication solution for Elixir/Phoenix with uberauth and Guardian.
      """
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [extra_applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      # Docs
      {:earmark, "~> 1.3", only: :docs},
      {:ex_doc, "~> 0.19", only: :docs},
      # Dev
      {:credo, "~> 1.4.0", only: [:dev, :test], runtime: false},
      # Authentication and authorization
      {:guardian, "~> 2.1"},
      {:ueberauth_identity, "~> 0.2"},
      {:ueberauth, "~> 0.6"},
      # Dependencies
      {:plug, "~> 1.10"},
      {:ecto_sql, "~> 3.0"},
      {:argon2_elixir, "~> 2.0"}
    ]
  end

  defp package do
    [
      maintainers: ["Peter Shoukry"],
      licenses: ["MIT"],
      links: %{github: "https://github.com/plus-eg/"}
    ]
  end
end
