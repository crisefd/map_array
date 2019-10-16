defmodule MapArray.MapArrayImpl do

  def new([], _), do: raise "MapArray needs to have dimensions"

  def new(dimensions, default_value) do
    dimensions
      |> Enum.reverse() 
      |> Enum.with_index()
      |> init_array(default_value)
  end

  def from_list(list) do
    list
    |> Enum.with_index()
    |> Enum.map(fn {item, idx} -> {idx, item}  end)
    |> Enum.into(%{})
  end

  def to_list(map) do
    Map.values(map)
  end

  def size(map), do: map_size(map)

  def get(map, [coor | []]), do: Map.get(map, coor)

  def get(map, [coor | coordinates]) do
    map
    |> Map.get(coor)
    |> get(coordinates) 
  end

  def put(map, [coor | []], value) do
    Map.put(map, coor, value)
  end

  def put(map, [ coor |coordinates], value ) do
     Map.put(map, coor, put(map[coor], coordinates, value))
  end

  def slice(%{0 => x}, _, _) when is_map(x), do: raise "MapArray.slice is only defined for 1-D arrays"

  def slice(map, from, until) do
    if from > until, do: raise "from cannot be greater than until"
    range = from..until
    map |> Map.take((range |> Enum.to_list()))
  end

  def reverse(map) do
    last_idx = map_size(map) - 1
    (last_idx..0)
    |> Enum.reduce(%{}, fn(idx, acc) ->
      Map.put(acc, abs(idx - last_idx), map[idx])
    end)
  end

  defp init_simple_array(dim, value) do
    0..(dim - 1)
    |> Enum.map(fn i -> {i,  value} end)
    |> Enum.into(%{})
  end

  defp init_array([], acc), do: acc

  defp init_array([{dim, 0} | dimidx], acc) do
    array = init_simple_array(dim, acc)
    init_array(dimidx, array)
  end

  defp init_array([{dim, _} | dimidx], acc) do
    array = init_simple_array(dim, acc)
    init_array(dimidx, array)
  end

end