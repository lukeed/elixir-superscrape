defmodule SuperScrape.Mixfile do
  use Mix.Project

  @desc "Read an Atom/RSS feed and concatenate it with deduplicated historical items from past versions saved in the Wayback Machine."

  def project do
    [app: :superscrape,
     version: "0.1.0",
     elixir: "~> 1.2",
     description: @desc,
     package: package,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:scrape]]
  end

  # Dependencies:
  defp deps do
    [{:wayback, "~> 0.1.0"},
     {:scrape, "~> 1.2"},
     {:ex_doc, "~> 0.13.0", only: :dev}]
  end

  def package do
    [name: :superscrape,
     maintainers: ["Luke Edwards"],
     licenses: ["MIT"],
     links: %{"Github" => "https://github.com/lukeed/elixir-superscrape"}]
  end
end
