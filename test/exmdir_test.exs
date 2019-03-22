defmodule ExmdirTest do
  use ExUnit.Case

  alias Exmdir.CLI
  doctest Mix.Tasks.Exmdir

  test "Test --help" do
    assert ["--help"] |> CLI.parse_args |> CLI.response == "usage: ls [-ABCFGHLOPRSTUWabcdefghiklmnopqrstuwx1] [file ...]"
  end

  test "formatting" do
    assert CLI.formatting(%{}) == "%{}"
  end  
end

