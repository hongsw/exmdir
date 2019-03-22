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
    |> stdout
    System.halt(0)
  end

  def parse_args(args) do
    {opts, word, _} =
      args
      |> OptionParser.parse(switches: [upcase: :boolean, halt: :boolean])
    Logger.info(inspect({opts, List.to_string(word)}) )
    {opts, List.to_string(word)}
  end
  def stdout(rsp) do
    cond do 
      String.valid?(rsp) == true-> 
        IO.puts(rsp)
      String.valid?(rsp) == false-> 
        rsp |> Enum.all?(fn x -> IO.puts(inspect(x)) end)
    end
  end

  def formatting(fileObject) do
    Kernel.inspect(fileObject)
  end
  def response({opts, word}) do
    cond do 
      opts[:halt] == true -> 
        System.halt(1)
      opts[:help] == true -> 
        "usage: ls [-ABCFGHLOPRSTUWabcdefghiklmnopqrstuwx1] [file ...]"
      word == "" and Keyword.has_key?(opts, :l) == false ->
        File.ls!() 
      opts[:l] == true -> 
        File.ls!() |> Enum.map(fn x -> fileObject(x) end)
        
      # true ->
      #   IO.puts('true')
    end
  end
  def fileObject(filename) do
    case File.stat filename do
      {:ok, stat} -> %{status: :ok, atime: stat.atime, size: stat.size, filename: filename}
      {:error, reason} -> %{status: :error, filename: filename}
    end
  end

end
