defmodule Protego.Changeset do

  def error_list_from(changeset) do
    changeset.errors
    |> Enum.reduce([], fn {field_name, {error_message, _}}, errors ->
      ["#{field_name} #{error_message}"] ++ errors
    end)
  end
end
