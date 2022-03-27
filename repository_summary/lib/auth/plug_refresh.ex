defmodule RepositorySummaryWeb.Auth.RefreshToken do
  import Plug.Conn

  alias RepositorySummaryWeb.Auth.Guardian

  def init(options), do: options

  def call(conn, _options) do
    old_token = Guardian.Plug.current_token(conn)

    with {:ok, new_token} <- Guardian.refresh_token(old_token) do
      put_private(conn, :refresh_token, new_token)
    end
  end
end
