defmodule GravityAssit do
  def find_opcode(params) do
    case params do
      {:loop, opcode_tab, index} ->
        input_tab = opcode_tab
        result = opcode_result(Enum.slice(input_tab, index, 4), opcode_tab, index)
        {exe_cond, return_val, idx} = result
        find_opcode({exe_cond, return_val, idx})

      {:halt, result, 0} ->
        result
    end
  end

  def opcode_result([1, input_1, input_2, output_pos], opcode_tab, index) do
    output_val = Enum.at(opcode_tab, input_1) + Enum.at(opcode_tab, input_2)

    result_tab =
      opcode_tab |> List.delete_at(output_pos) |> List.insert_at(output_pos, output_val)

    {:loop, result_tab, index + 4}
  end

  def opcode_result([2, input_1, input_2, output_pos], opcode_tab, index) do
    output_val = Enum.at(opcode_tab, input_1) * Enum.at(opcode_tab, input_2)

    result_tab =
      opcode_tab |> List.delete_at(output_pos) |> List.insert_at(output_pos, output_val)

    {:loop, result_tab, index + 4}
  end

  def opcode_result([99, _, _, _], opcode_tab, _) do
    {:halt, opcode_tab, 0}
  end

  def opcode_result(_, opcode_tab, _) do
    {:halt, opcode_tab, 0}
  end
end

output_lst =
  GravityAssit.find_opcode(
    {:loop,
     [
       1,
       12,
       2,
       3,
       1,
       1,
       2,
       3,
       1,
       3,
       4,
       3,
       1,
       5,
       0,
       3,
       2,
       1,
       10,
       19,
       2,
       9,
       19,
       23,
       2,
       23,
       10,
       27,
       1,
       6,
       27,
       31,
       1,
       31,
       6,
       35,
       2,
       35,
       10,
       39,
       1,
       39,
       5,
       43,
       2,
       6,
       43,
       47,
       2,
       47,
       10,
       51,
       1,
       51,
       6,
       55,
       1,
       55,
       6,
       59,
       1,
       9,
       59,
       63,
       1,
       63,
       9,
       67,
       1,
       67,
       6,
       71,
       2,
       71,
       13,
       75,
       1,
       75,
       5,
       79,
       1,
       79,
       9,
       83,
       2,
       6,
       83,
       87,
       1,
       87,
       5,
       91,
       2,
       6,
       91,
       95,
       1,
       95,
       9,
       99,
       2,
       6,
       99,
       103,
       1,
       5,
       103,
       107,
       1,
       6,
       107,
       111,
       1,
       111,
       10,
       115,
       2,
       115,
       13,
       119,
       1,
       119,
       6,
       123,
       1,
       123,
       2,
       127,
       1,
       127,
       5,
       0,
       99,
       2,
       14,
       0,
       0
     ], 0}
  )

IO.inspect(output_lst)
