defmodule Backfeed.Mixfile do
  use Mix.Project

  def project do
    [app: :backfeed,
     version: "0.1.0",
     elixir: "~> 1.3",
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:wayback, :scrape]]
  end

  # Dependencies:
  defp deps do
    [{:wayback, "~> 0.1.0"},
     {:scrape, "~> 1.2"}]
  end
end
