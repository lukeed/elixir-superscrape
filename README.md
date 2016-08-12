# SuperScrape [![Build Status](https://travis-ci.org/lukeed/elixir-superscrape.svg?branch=master)](https://travis-ci.org/lukeed/elixir-superscrape) [![Hex pm](http://img.shields.io/hexpm/v/superscrape.svg?style=flat)](https://hex.pm/packages/superscrape)

> Read an Atom/RSS feed and concatenate it with deduped historical items from past versions saved in the [Wayback Machine](https://archive.org/web/). ([View Docs](https://hexdocs.pm/superscrape/SuperScrape.html))

## Install

1. Add `superscrape` to your list of dependencies in `mix.exs`:

  ```elixir
  def deps do
    [{:superscrape, "~> 0.1.0"}]
  end
  ```

2. Ensure `superscrape` is started before your application:

  ```elixir
  def application do
    [applications: [:superscrape]]
  end
  ```

## Usage

View the [online documentation](https://hexdocs.pm/superscrape/SuperScrape.html) for more information.

```elixir
url = "https://elixir-jobs.org/feed"

SuperScrape.process url
#=> [%{...}, %{...}, %{...}]

SuperScrape.process! url
#=> ["https://elixir-jobs.org/jobs/26", "..."]

SuperScrape.process! [url, "..."]
#=> ["https://elixir-jobs.org/jobs/26", "..."]

SuperScrape.lookup url
#=> ["http://web.archive.org/web/...", "..."]

SuperScrape.open "https://elixir-jobs.org/jobs/26"
#=> %{description: "...", title: "...", ...}
```

## License

MIT © [Luke Edwards](https://lukeed.com)
