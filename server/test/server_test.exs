defmodule ServerTest do
  use ExUnit.Case
  doctest Server

  test "get response" do
    assert Server.Controller.handle_request(
      """
      GET / HTTP/1.1\r
      User-Agent: Mozilla/4.0 (compatible; MSIE5.01; Windows NT)\r
      Host: www.tutorialspoint.com\r
      Accept-Language: en-us\r
      Accept-Encoding: gzip, deflate\r
      Connection: Keep-Alive\r
      \r
      """
    ) ==
      """
      HTTP/1.1  \r\nContent-Type: text/html\r\nContent-Length: 25\r\n\r\n<p>sho katt gissa vem</p>
      """
    end

    test "get parsed" do
      assert Server.Parser.parse(
        """
        GET / HTTP/1.1\r
        User-Agent: Mozilla/4.0 (compatible; MSIE5.01; Windows NT)\r
        Host: www.tutorialspoint.com\r
        Accept-Language: en-us\r
        Accept-Encoding: gzip, deflate\r
        Connection: Keep-Alive\r
        \r
        """
      ) == %Server.Conv{
        headers: %{
          "Accept-Encoding" => "gzip, deflate",
          "Accept-Language" => "en-us",
          "Connection" => "Keep-Alive",
          "Host" => "www.tutorialspoint.com",
          "User-Agent" => "Mozilla/4.0 (compatible; MSIE5.01; Windows NT)"
        },
        method: "GET",
        params: %{},
        path: "/",
        resp_body: "",
        resp_content_type: "text/html",
        status: nil
      }
    end


end
