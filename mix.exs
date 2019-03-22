defmodule Exmdir.MixProject do
  use Mix.Project

  def project do
    [
      app: :exmdir,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      # preferred_cli_env: ["coveralls": :test,
      #  "coveralls.detail": :test, "coveralls.post": :test, "coveralls.html": :test],
      escript: escript(),
      # Docs
      name: "ExMDir",
      source_url: "https://gitlab.com/carryprotocol/hongseungwoo-ls",
      homepage_url: "https://gitlab.com/carryprotocol/hongseungwoo-ls",
      docs: [
        main: "ExMDir", # The main page in the docs
        logo: "media/logo.png",
        extras: ["README.md"]
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, only: :dev, runtime: false},
      {:excoveralls, "~> 0.10", only: :test},
      {:stream_data, "~> 0.4.2", only: [:dev, :test], runtime: false},
      {:credo, "~> 0.9.0-rc1", only: :dev, runtime: false},
      {:mix_test_watch, "~> 0.5", only: :dev, runtime: false},
      {:dialyxir, "~> 0.5", only: :dev, runtime: false}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end

  defp escript do
    [main_module: Exmdir.CLI]
  end
end
