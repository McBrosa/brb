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
      extra_applications: [:logger, :runtime_tools, :phoenix],
      mod: {Brb, []}
    ]
  end

  defp deps do
    [
      {:phoenix, "~> 1.7.20"},
      {:phoenix_html, "~> 4.2"},
      {:phoenix_live_view, "~> 1.0.4"},
      {:cowboy, "~> 2.8"},
      {:ecto_sql, "~> 3.12.1"},
      {:postgrex, ">= 0.20.0"},
      {:ex_doc, "~> 0.37", only: :dev, runtime: false},
      {:jason, "~> 1.4.4"},
      {:gettext, "~> 0.26.2"},
      {:plug_cowboy, "~> 2.7.2"},
      {:phoenix_html_helpers, "~> 1.0"}
    ]
  end
end

