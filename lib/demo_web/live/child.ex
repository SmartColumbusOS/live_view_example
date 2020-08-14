defmodule DemoWeb.Child do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
    <div class="child" phx-click="hello"><%= @text %>
    <%= if @text == "Start" do %>
    <%= live_component @socket, DemoWeb.Grandchild, text: @text, id: :grandchild_thing %>
    <% end %>
    </div>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, text: "Start")}
  end

  @impl true
  def handle_event("hello", _, socket) do
    "sending hello" |> IO.inspect(label: "child.ex:19")
    send(socket.parent_pid, :hello)
    {:noreply, assign(socket, text: "Hello")}
  end
end
