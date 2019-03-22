defmodule Exmdir.CLI do
  @moduledoc """
  Documentation for Exmdir.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Exmdir.hello()
      :world

  """
  def main(args \\ []) do
    args
    |> parse_args
    |> response
    |> IO.puts()
  end

  def parse_args(args) do
    {opts, word, _} =
      args
      |> OptionParser.parse(switches: [upcase: :boolean, halt: :boolean])
    if opts[:halt], do: System.halt(1), else: {opts, List.to_string(word)}
    # System.stop(1)
    
  end

  def response({opts, "Hello"}), do: response({opts, "World"})

  def response({opts, word}) do
    if opts[:upcase], do: String.upcase(word), else: word
  end

end
