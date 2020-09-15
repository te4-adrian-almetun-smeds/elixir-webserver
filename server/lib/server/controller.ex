defmodule Server.Controller do
  alias Server.Router
  alias Server.Parser
  alias Server.Conv
  alias Server.Formatter
  # alias Server.
  @pages_path Path.expand("../../pages", __DIR__)

  def handle_request(request) do
    request
    |> Parser.parse()
    # |> IO.inspect()
    |> Router.route()
    # |> IO.inspect()
    |> Formatter.format_response()
  end

end
