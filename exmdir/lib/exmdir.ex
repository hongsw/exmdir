defmodule Mix.Tasks.Exmdir do
  use Mix.Task
  @moduledoc false

  
  @shortdoc "prepend stdin with args string"
  def run(argv) do
    Exmdir.CLI.main(argv)
  end
end
