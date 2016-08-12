defmodule SuperScrapeTest do
  use ExUnit.Case
  import SuperScrape
  doctest SuperScrape

  @url "https://elixir-jobs.org/feed"
  @bad "https://www.lukeed.com"

  def is_url(str), do: String.contains?(str, "http")

  test "lookup" do
    res = lookup @url
    one = List.first res
    assert res |> is_list
    assert one |> is_binary
    assert one |> is_url
  end

  test "process feed url" do
    res = process @url
    one = List.first res
    assert res |> is_list
    assert one |> is_map
  end

  test "process non-feed url" do
    res = process @bad
    assert res |> is_list
    assert res |> Enum.empty?
  end

  test "process! feed url" do
    res = process! @url
    one = List.first res
    assert res |> is_list
    assert one |> is_binary
  end

  test "process! non-feed url" do
    res = process! @bad
    assert res |> is_list
    assert res |> Enum.empty?
  end

  test "process list" do
    res = process [@url]
    one = List.first res
    assert res |> is_list
    assert one |> is_map
  end

  test "process empty list" do
    res = process []
    assert res |> is_list
    assert res |> Enum.empty?
  end

  test "open an article" do
    res = open @url
    assert res |> is_map
  end
end
