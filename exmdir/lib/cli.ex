defmodule Exmdir.CLI do
  import File

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
    System.halt(0)
  end

  def parse_args(args) do
    {opts, word, _} =
      args
      |> OptionParser.parse(switches: [upcase: :boolean, halt: :boolean])
    if opts[:halt], do: System.halt(1), else: {opts, List.to_string(word)}
    {opts, word}
  end

  def response({opts, "Hello"}) do
    response({opts, "World"})
    |> IO.puts
  end

  # def response({opts, word}) do
  #   if opts[:upcase], do: String.upcase(word), else: word
  #   |> IO.puts
  # end

  def response({opts, word}) do
    File.ls!() |> Enum.all?(fn x -> IO.puts(x) end)
  end

end
