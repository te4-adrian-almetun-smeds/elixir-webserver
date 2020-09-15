defmodule Server.Router do
  alias Server.Conv
  alias Server.Routes

  def route(%Conv{method: "GET"} = conv) do
    %{conv | resp_body: Routes.get(conv.path, conv)}
  end
end
