defmodule Redditex.Mixfile do
  use Mix.Project

  def project do
    [app: :redditex,
     version: "0.0.1",
     elixir: "~> 0.15.0",
     escript: escript_config,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:httpoison]]
  end

  # Dependencies can be hex.pm packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [
      {:httpoison, "~> 0.3"},
      {:hackney,   github: "benoitc/hackney", tag: "0.13.0" },
      {:poison, github: "devinus/poison"}
    ]
  end

  def escript_config do
    [main_module: Redditex.CLI]
  end
end
