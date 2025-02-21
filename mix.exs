defmodule Brb.MixProject do
  use Mix.Project

  def project do
    [
      app: :brb,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger, :runtime_tools],
      mod: {Brb, []}
    ]
  end

  defp deps do
    [
      {:phoenix, "~> 1.5.9"},
      {:phoenix_html, "~> 2.14"},
      {:phoenix_live_view, "~> 0.15.7"},
      {:cowboy, "~> 2.8"},
      {:ecto_sql, "~> 3.6"},
      {:postgrex, ">= 0.0.0"},
      {:ex_doc, "~> 0.24", only: :dev, runtime: false},
      {:jason, "~> 1.2"},
      {:gettext, "~> 0.18"},
      {:plug_cowboy, "~> 2.0"}
    ]
  end
end
