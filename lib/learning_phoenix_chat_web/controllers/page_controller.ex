defmodule LearningPhoenixChatWeb.PageController do
  use LearningPhoenixChatWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
