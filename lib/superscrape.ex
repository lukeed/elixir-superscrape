defmodule SuperScrape do
  import Scrape, except: [website: 1]
  import Wayback, only: [links: 1]

  @spec lookup(String.t) :: [String.t]
  def lookup(url), do: Wayback.links(url)

  @spec process(String.t | List.t) :: [tuple()]
  def process(url) when is_binary(url), do: handler(lookup(url), &feed/1)
  def process(url) when is_list(url), do: handler(url, &feed/1)

  @spec process!(String.t | List.t) :: [String.t]
  def process!(url) when is_binary(url), do: handler(lookup(url), &feed(&1, :minimal))
  def process!(url) when is_list(url), do: handler(url, &feed(&1, :minimal))

  # @todo: Task.await/async iteration
  defp handler(list, func), do: Enum.map(list, func) |> List.flatten |> Enum.uniq

  @spec open(String.t) :: map()
  def open(url), do: article(url)
end
