defmodule Inmana.Welcomer do
  def welcome(%{"name" => name, "age" => age, "gender" => gender}) do
    age = String.to_integer(age)

    name
    |> String.trim()
    |> String.downcase()
    |> evaluate(age, gender)
  end

  defp evaluate("banana", 42, _gender) do
    {:ok, "You are very special banana"}
  end

  defp evaluate(name, age, _gender) when age >= 18 do
    {:ok, "Welcome #{name}"}
  end

  defp evaluate(name, _age, gender) do
    {:error, "Welcome shall not pass #{name} - #{gender}"}
  end
end
