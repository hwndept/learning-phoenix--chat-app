defmodule ChatAppWeb.PageControllerTest do
  use ChatAppWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Chat demo app"
  end
end
