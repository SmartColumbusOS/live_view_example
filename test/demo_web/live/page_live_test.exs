defmodule DemoWeb.PageLiveTest do
  use DemoWeb.ConnCase

  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, _} = live(conn, "/")

    html = page_live |> find_live_child("child_thing") |> element(".child") |> render_click()

    refute html =~ "Hello"
  end
end
