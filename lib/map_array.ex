defmodule MapArray do
  alias MapArray.MapArrayImpl

  @spec new(List.t(), any()) :: Map.t()

  @spec from_list(List.t()) :: Map.t()

  @spec get(Map.t(), List.t()) :: any()

  @spec put(Map.t(), List.t(), any()) :: Map.t()

  @spec slice(Map.t(), Integer.t(), Integer.t()) :: Map.t()

  def new(dimensions, default_value \\ nil) do
    MapArrayImpl.new(dimensions, default_value)
  end

  def from_list(list) do
    MapArrayImpl.from_list(list)
  end

  def get(map_array, coordinates) do
    MapArrayImpl.get(map_array, coordinates)
  end

  def put(map_array, coordinates, value) do
    MapArrayImpl.put(map_array, coordinates, value)
  end

  def slice(map_array, from, until) do
    MapArrayImpl.slice(map_array, from, until)
  end

end
