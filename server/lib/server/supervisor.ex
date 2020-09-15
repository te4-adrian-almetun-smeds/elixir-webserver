defmodule Server.Supervisor do
  alias Server.HttpServer

  def start(port) when is_integer(port) and port > 1023 do
    spawn(fn -> HttpServer.start(port) end)
    |> IO.inspect()
    |> life_checker(port)
  end

  def life_checker(pid, port) do
    :timer.sleep(1000)
    Process.alive?(pid)
    |> resurrect(pid, port)
  end

  def resurrect(true, pid, port), do: life_checker(pid, port)
  def resurrect(false, _pid, port), do: spawn(fn -> start(port) end)

end
