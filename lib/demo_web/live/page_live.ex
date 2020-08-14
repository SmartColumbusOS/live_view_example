defmodule DemoWeb.PageLive do
  use DemoWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, display_child: true)}
  end

  def handle_info(:hello, socket) do
    "you had me at hello" |> IO.inspect(label: "page_live.ex:10")
    {:noreply, assign(socket, display_child: false)}
  end
end
