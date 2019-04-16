defmodule Protego.Changeset do

  def error_map_from(changeset) do
    changeset.errors
    |> Enum.reduce([], fn attribute, errors ->
      field_name = elem(attribute, 0)
      error_message = elem(elem(attribute, 1), 0)
      ["#{field_name} #{error_message}"] ++ errors
    end)
  end
end
