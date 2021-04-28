# Goal find largest product of 4 numbers in the grid (up/down, across, diagonally)

defmodule Helpers do
  def parse_line(line) do
    line
    |> String.split(" ")
    |> Enum.map(&(elem(Integer.parse(&1), 0)))
  end

  # Input: List of integers
  def find_max_product(list) do
    last_index = Enum.count(list) - 1
    0..last_index
    |> Enum.map(&(find_slice_product(list, &1)))
  end

  def find_slice_product(list, index) do
    Enum.slice(list, index, 4)
    |> Enum.reduce(1, &(&1*&2))
  end

  def find_max_of_products(list) do
    list
    |> Enum.map(&(Helpers.find_max_product(&1)))
    |> Enum.map(&(Enum.max(&1)))
    |> Enum.max
  end

  def grid_with_indices(list) do
    list
    |> Enum.map(&(Enum.with_index(&1)))
    |> Enum.with_index
    |> Enum.map(fn(tuple) ->
                  {list, row_index} = tuple
                  Enum.map(list, fn(tuple) ->
                                  {value, col_index} = tuple
                                  {value, row_index, col_index}
                                 end)
                end)
    |> List.flatten
  end

  def left_down_diagnonals(grid) do
    0..38 # from (0, 0) to (19, 19)
    |> Enum.map(fn(num) ->
                  Enum.filter(grid, fn(tuple) ->
                                      {_, row_index, col_index} = tuple
                                      row_index + col_index == num
                                    end)
                  |> Enum.map(&(elem(&1, 0)))
                end)
  end


end

{:ok, text} = File.read("grid.txt")

grid = text
  |> String.split("\n")
  |> Enum.drop(-1) # last array element is just an empty string
  |> Enum.map(&Helpers.parse_line/1)


across_grid_max = grid
  |> Enum.map(&(Helpers.find_max_product(&1)))
  |> Enum.map(&(Enum.max(&1)))
  |> Enum.max


# from https://stackoverflow.com/questions/23705074/is-there-a-transpose-function-in-elixir
updown_grid_max = grid
  |> List.zip
  |> Enum.map(&Tuple.to_list/1)
  |> Helpers.find_max_of_products


grid_with_indices = grid
  |> Helpers.grid_with_indices

left_down_diagonal_max = grid_with_indices
  |> Helpers.left_down_diagnonals
  |> Helpers.find_max_of_products


right_down_diagonal_max = grid
  |> Enum.map(&Enum.reverse/1)
  |> Helpers.grid_with_indices
  |> Helpers.left_down_diagnonals
  |> Helpers.find_max_of_products

IO.inspect Enum.max([across_grid_max, updown_grid_max, left_down_diagonal_max, right_down_diagonal_max])
