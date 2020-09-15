defmodule Server.Supervisor do
  alias Server.HttpServer

  def start(port) when is_integer(port) and port > 1023 do
    server = spawn(fn -> HttpServer.start(port))
  end

end
