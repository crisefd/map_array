defmodule MapArrayTest do
  use ExUnit.Case
  doctest MapArray

  test "new 1-D array" do
    array = MapArray.new [3]
    assert length(Map.keys(array)) === 3
    assert array[0] === nil
    assert array[1] === nil
    assert array[2] === nil

    array = MapArray.new [3], "a"
    assert length(Map.keys(array)) === 3
    assert array[0] === "a"
    assert array[1] === "a"
    assert array[2] === "a"

  end

  test "new 2-D array" do
     array = MapArray.new [3, 2], "a"
     assert length(Map.keys(array)) === 3
     assert length(Map.keys(array[0])) === 2

     assert array[2][1] === "a"
  end

  test "new 3-D array" do
    array = MapArray.new [1, 2, 3]
    assert length(Map.keys(array)) === 1
    assert length(Map.keys(array[0])) === 2
    assert length(Map.keys(array[0][0])) === 3

    assert array[0][1][2] === nil
  end

  test "test get function" do
    array = %{ 0 => %{ 0 => "a", 1 => "b" },
               1 => %{ 0 => "c", 1 => "d"} }
    assert array[0][0] === MapArray.get(array, [0, 0])
    assert array[0][1] === MapArray.get(array, [0, 1])
    assert array[1][0] === MapArray.get(array, [1, 0])
    assert array[1][1] === MapArray.get(array, [1, 1])

    array2 = %{ 0 => array }

    assert array2[0][1][1] === MapArray.get(array2, [0, 1, 1])
  end

  test "test slice function" do
    array = %{ 0 => "a", 1 => "b", 2 => "c", 3 => "d", 4 => "e"}
    MapArray.slice(array, 0, 2) == %{ 0 => "a", 1 => "b", 2 => "c" }
    MapArray.slice(array, 2, 4) == %{ 2 => "c", 3 => "d", 4 => "e" }
    MapArray.slice(array, 2, 2) == %{ 2 => "c" }
  end

  test "test put function" do
    array = %{ 0 => %{ 0 => %{ 0 => "a", 1 => "b" },
                       1 => %{ 0 => "c", 1 => "d"} } }
    expected = %{ 0 => %{ 0 => %{ 0 => "a", 1 => "b" },
                          1 => %{ 0 => "c", 1 => 100} } }
    result = MapArray.put(array, [0, 1, 1], 100)

    assert result == expected
  end

  test "test to_list function" do
    array = %{ 0 => "a", 1 => "b", 2 => "c"}
    assert MapArray.to_list(array) == ["a", "b", "c"]
  end

  test "test reverse fnction" do
    array = %{ 0 => "a", 1 => "b", 2 => "c"}
    assert MapArray.reverse(array) == %{ 2 => "a", 1 => "b", 0 => "c" }
  end

end
