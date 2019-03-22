defmodule Exmdir.CLI do
  import File
  require Logger
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
    |> IO.puts
    System.halt(0)
  end

  def parse_args(args) do
    {opts, word, _} =
      args
      |> OptionParser.parse(switches: [upcase: :boolean, halt: :boolean])
    Logger.info(inspect({opts, List.to_string(word)}) )
    {opts, List.to_string(word)}
  end

  def response({opts, word}) do
    cond do 
      opts[:halt] == true -> 
        System.halt(1)
      opts[:help] == true -> 
        "usage: ls [-ABCFGHLOPRSTUWabcdefghiklmnopqrstuwx1] [file ...]"
      word == "" ->
        File.ls!() |> Enum.all?(fn x -> IO.puts(x) end)
      # true ->
      #   IO.puts('true')
    end
  end

end
