defmodule Server.Router do
  alias Server.Conv


  def route(%Conv{method: "GET"} = conv) do
    %{conv | resp_body: get(conv.path, conv)}
  end


  def get("/", conv) do

    html :index

  end

  def get(path, conv), do: html :'404'

  def html(filename) do
    pages_path = Path.expand("../../pages", __DIR__)
    IO.puts("#{pages_path}/#{Atom.to_string(filename)}")
    File.read("#{pages_path}/#{Atom.to_string(filename)}.html")
    |> verify_file()
  end

  def verify_file({:ok, val}), do: val

end
