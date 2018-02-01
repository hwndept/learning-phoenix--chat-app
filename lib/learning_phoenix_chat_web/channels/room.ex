defmodule LearningPhoenixChatWeb.Room do
  use Phoenix.Channel

  alias LearningPhoenixChat.{Repo, Message}

  def join("room:general", _message, socket) do
    {:ok, socket}
  end

  def handle_in("message", %{"text" => text}, socket) do
    {_, record } = Repo.insert(%Message{text: text});

    broadcast! socket, "message", %{text: record.text, time: record.inserted_at}
    {:noreply, socket}
  end

  def handle_in("history", _message, socket) do
    messages = Enum.reduce Repo.all(Message), [], fn(message, acc) ->
      acc ++ [ %{text: message.text, time: message.inserted_at} ]
    end

    push socket, "history", %{messages: messages}
    {:noreply, socket}
  end
end
