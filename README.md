# MapArray

**A Simple array-like data structure based on the Map datatype**

My motivation for making this library was because I needed C-like 
array datastructures and Erlang's array library was uncomfortable to work with
 due to how ugly it's output in the console is and the fact that it was missing
some functionalities that I needed. And, the other array-matrix libraries built for
Elixir were made with enphasis in math. So I decided I need a simpler library
with some basic functionality mimicking the arrays in other languages.

A MapArray is simply another map, one in which all keys are non-negative integers, but
a map regardless, so all functions from Map API still work on MapArray.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `map_array` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:map_array, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/map_array](https://hexdocs.pm/map_array).

