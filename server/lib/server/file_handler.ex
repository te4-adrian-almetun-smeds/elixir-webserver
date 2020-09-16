defmodule Server.FileHandler do
  def html(filename) do
    pages_path = Path.expand("../../pages", __DIR__)
    File.read("#{pages_path}/#{Atom.to_string(filename)}.html")
    |> verify_file()
  end

  defp verify_file({:ok, val}), do: val
  defp verify_file({:error, val}), do: "The following error was given when trying to read a file: #{Atom.to_string(val)}"
end
