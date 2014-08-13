defmodule Redditex.Item do
  defstruct [:title, :url, :num_comments]

  defimpl Inspect do
    def inspect(item = %Redditex.Item{title: title, url: url, num_comments: n}, _opts = %Inspect.Opts{}) do
      "#{title} #{comment(n)}\n#{url}\n"
    end

    defp comment(0), do: ""
    defp comment(1), do: "(1 comment)"
    defp comment(n), do: "(#{n} comments)"

  end
end
