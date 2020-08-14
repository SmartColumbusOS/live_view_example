defmodule DemoWeb.Grandchild do
  use Phoenix.LiveComponent

  def render(assigns) do
    ~L"""
    <div class="grandchild"><%= @text %></div>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
