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
    stdio = IO.stream(:stdio, :line)
    args
    |> parse_args(stdio)
    |> response
    |> stdout
    System.halt(0)
  end

  @doc """
  파싱합니다.

  ## Examples

      iex> .parse_args(" --help")
      "help"

  """
  def parse_args(args) do
    parse_args(args, [""]) 
  end

  def parse_args(args, path) do
    {opts, word, _} =
      args
      |> OptionParser.parse(switches: [upcase: :boolean, halt: :boolean])
    # Logger.info(inspect({opts, List.to_string(word), path |> Enum.to_list |> Enum.at(0) |> String.trim}) )
    {opts, List.to_string(word), path |> Enum.to_list |> Enum.at(0) |> String.trim}
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

  def response({opts, word, path}) do
    cond do 
      opts[:halt] == true -> 
        System.halt(1)
      opts[:help] == true -> 
        "usage: ls [-ABCFGHLOPRSTUWabcdefghiklmnopqrstuwx1] [file ...]"
      word == "" and Keyword.has_key?(opts, :l) == false ->
        File.ls!(path) 
      opts[:l] == true -> 
        File.ls!(path) |> Enum.map(fn x -> fileObject(path, x) end)
        
      # true ->
      #   IO.puts('true')
    end
  end
  def fileObject(path, filename) do
    case File.stat Path.join(["./", path, filename]) do
      {:ok, stat} -> %{status: :ok, atime: stat.atime, size: stat.size, filename: filename}
      {:error, reason} -> %{status: :error, filename: filename}
    end
  end

end
