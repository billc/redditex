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
      { _, subreddit, _ }
        -> { subreddit }
      _ -> :help
    end
  end

  def process(:help) do
    IO.puts """
    usage: redditex <subreddit>
    """
    System.halt(0)
  end

  def process({ subreddit }) do
    Redditex.Client.get(subreddit)
    |> output_response
  end

  def output_response({ :ok, items }) do
    # Enum.each(items, fn (x) -> IO.puts "#{x.title}\n#{x.url}\n" end)
    Enum.each(items, &(IO.inspect(&1)) )
  end

  def output_response({ :error, error}) do
    IO.puts error
  end
end
