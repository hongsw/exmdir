# Exmdir
linux command 'ls' writhin elixir, ms-dos's mdir style

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `exmdir` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:exmdir, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/exmdir](https://hexdocs.pm/exmdir).


## Unit Testing & Coveralls
```command
MIX_ENV=test mix coveralls
```

## Command Line Testing Guide
```command
ls -al
ls -alc
ls -alb
ls -alcdf
ls -alf
ls -als
echo -e "./Music" | ls
ls | 1> test
ls 1231239dishf
echo $?
ls
echo $?
```

```command
exmdir -al
exmdir -alc
exmdir -alb
exmdir -alcdf
exmdir -alf
exmdir -als
echo -e "./Music" | exmdir
exmdir | 1> test
exmdir 1231239dishf
echo $?
exmdir
echo $?
```

## Debugging
```command
iex -S mix exmdir
```

## Document Generation
```command
mix docs
open ./doc/index.html
```
