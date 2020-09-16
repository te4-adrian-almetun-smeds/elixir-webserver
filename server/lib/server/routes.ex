defmodule Server.Routes do
  import Server.FileHandler

  def get("/", _conv), do: html :index

  # 404 - Page not found
  def get(_path, _conv), do: html :'404'

end
