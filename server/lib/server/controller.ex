defmodule Server.Controller do
  alias Server.Router
  alias Server.Parser
  alias Server.Formatter

  def handle_request(request) do
    request
    |> Parser.parse()
    |> Router.route()
    |> Formatter.format_response()
  end

end
