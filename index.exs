defmodule Elix.Mixfile do
  use Mix.Project

  def project do
    [app: :botMessage,
     version: "0.1.0",
     elixir: "~> 1.14.5",
     elixirc_paths: elixirc_paths(Mix.env),
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end


  def application do
    [
      mod: {Elix, []},
      extra_applications: [:logger]
    ]
  end
end
