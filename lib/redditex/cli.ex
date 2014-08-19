defmodule Redditex.CLI do
  @moduledoc """
  Command line parser for fetching Reddit articles for a given subrreddit
  """

  def main(argv) do
    parse_args(argv)
    |> process
  end

  @doc """
  `argv` can be -h or --help to return help

  Pass a valid subreddit name

  Prints a list {Title, Number of Comments, & article link}
  of the 20 most recent articles for the subreddit.
  """
  def parse_args(argv) do
    parse = OptionParser.parse(argv,  switches: [ help: :boolean],
                                      aliases: [ h:   :help])
    case parse do
      { [ help: true ], _, _ }
        -> :help
      { _, args, _ }
        -> args
      _ -> :help
    end
  end

  def process(:help) do
    IO.puts """
    usage: redditex <subreddit1> <subreddit2> <subreddit3> ...
    """
    System.halt(0)
  end

  def process( subreddits ) do
    subreddits
    |> Enum.map( &(Task.async(Redditex.Client, :get, [&1])))
    |> Enum.map( &(Task.await(&1)))
    |> Enum.each( fn(x) -> output_response(x) end)
  end

  def output_response({ :ok, items }) do
    # Enum.each(items, fn (x) -> IO.puts "#{x.title}\n#{x.url}\n" end)
    Enum.each(items, &(IO.inspect(&1)) )
  end

  def output_response({ :error, error}) do
    IO.puts error
  end
end
