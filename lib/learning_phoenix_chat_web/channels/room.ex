defmodule LearningPhoenixChatWeb.Room do
  use Phoenix.Channel

  def join("room:general", _message, socket) do
    {:ok, socket}
  end

  def handle_in("message", %{"text" => text}, socket) do
    time = DateTime.utc_now()
    IO.inspect(%{text: text, time: time});
    broadcast! socket, "message", %{text: text, time: time}
    {:noreply, socket}
  end
end
