Redditex
========

Elixir port of example GO tutorial: [geddit](https://github.com/nf/reddit). Redditex retrieves the most recent headlines from a given subreddit. redditex is a runnable example assuming you have Elixir installed.

## Design
Redditex mostly replicates the behavior found in the Go tutorial exceptions being

* Redditex Item structure does not remap number of comments, instead it uses the same field name found in the Reddit JSON response

* Errors throw a system halt

## Comparison
Both version are great examples for highlighting language features.

With the Elixir version was a exercise for my own personal learning. I borrowed heavily from teachings found in the excellent [Programming Elixir book](http://pragprog.com/book/elixir/programming-elixir) by Dave Thomas. By porting the Go application, I found Elixir

* significantly different paradox for programming. The concepts around pattern matching and pipelines are extremely powerful and work well with this problem.

* well suited to interfacing with HTTP APIs via the HTTPoison library.

* even with the added complexity of functional programming, the solution felt more straight forward than the Dart port. This may be due to the added difficulty introduced by asynchronous programming that I avoided in the Elixir version. Elixir supports asynchronous execution, but I did not tackle it with this version.
