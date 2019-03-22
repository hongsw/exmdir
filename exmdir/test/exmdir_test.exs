defmodule ExmdirTest do
  use ExUnit.Case

  alias Exmdir.CLI
  doctest Mix.Tasks.Exmdir

  test "greets the world in escript" do
    assert ["Hello"] |> CLI.parse_args |> CLI.response == :ok
  end

end
