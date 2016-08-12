defmodule SuperScrape do
  import Scrape, except: [website: 1]
  import Wayback, only: [links: 1]

  @doc """
  Get all URL moments from Archive's Wayback Machine.
  """
  @spec lookup(String.t) :: [String.t]
  def lookup(url), do: Wayback.links(url)

  @doc """
  Process a single or group of RSS/Atom feed urls.

  Returns all feed data per unique entry.
  """
  @spec process(String.t | List.t) :: [map()]
  def process(url) when is_binary(url), do: handler(lookup(url), &feed/1)
  def process(url) when is_list(url), do: handler(url, &feed/1)

  @doc """
  Process a single or group of RSS/Atom feed urls.

  Returns a list of unique URLs.
  """
  @spec process!(String.t | List.t) :: [String.t]
  def process!(url) when is_binary(url), do: handler(lookup(url), &feed(&1, :minimal))
  def process!(url) when is_list(url), do: handler(url, &feed(&1, :minimal))

  # @todo: Task.await/async iteration
  defp handler(list, func), do: Enum.map(list, func) |> List.flatten |> Enum.uniq

  @doc """
  Read a single URL and return all available data. Intended for article and webpage scraping.
  """
  @spec open(String.t) :: map()
  def open(url), do: article(url)
end
