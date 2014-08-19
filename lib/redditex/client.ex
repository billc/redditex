defmodule Redditex.Client do

  @user_agent [ {"User-agent", "Elixir test@example.com"}]

  def get(subreddit) do
    subreddit_url(subreddit)
    |> HTTPoison.get(@user_agent)
    |> handle_response
  end

  def subreddit_url(subreddit) do
    "http://www.reddit.com/r/#{subreddit}.json"
  end

  def handle_response(%{status_code: 200, body: body}) do
    json = Poison.decode!(body, as: %{"data" => %{"children" => [%{"data" => Redditex.Item}]}})

    # Got to be a way to make these statement more Elixir like.
    # Tried a pipe but was unable to order tuple with items as the second parameter in response tuple
    items = Enum.map( json["data"]["children"], fn (x) -> x["data"] end )
    {:ok, items}
  end

  def handle_response(%{status_code: _, body: body}), do: { :error, body }
end
