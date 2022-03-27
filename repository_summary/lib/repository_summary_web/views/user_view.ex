defmodule RepositorySummaryWeb.UserView do
  use RepositorySummaryWeb, :view

  alias RepositorySummary.User

  def render("create.json", %{user: %User{} = user}) do
    %{
      message: "User created",
      user: user
    }
  end

  def render("sign_in.json", %{token: token}) do
    %{
      token: token
    }
  end
end
