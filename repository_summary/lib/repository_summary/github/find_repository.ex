defmodule RepositorySummary.FindRepository do
  use Tesla

  alias RepositorySummary.Error
  alias Tesla.Env

  @base_url "https://api.github.com/users/"

  plug(Tesla.Middleware.Headers, [{"user-agent", "RepositorySummary"}])
  plug(Tesla.Middleware.JSON)

  def call(url \\ @base_url, repository_owner) do
    "#{url}#{repository_owner}/repos"
    |> get()
    |> handle_get()
  end

  defp handle_get({:ok, %Env{status: 404, body: %{"message" => "Not Found"}}}),
    do: {:error, Error.build(:not_found, "Repository Owner not found")}

  defp handle_get({:ok, %Env{status: 200, body: body}}), do: format_body(body)

  defp format_body(body) do
    new_body = Enum.map(body, fn repository -> generate_map(repository) end)

    {:ok, new_body}
  end

  defp generate_map(
         %{
           "id" => id,
           "name" => name,
           "description" => description,
           "html_url" => html_url,
           "stargazers_count" => stargazers_count
         } = _map
       ),
       do: %{
         "id" => id,
         "name" => name,
         "description" => description,
         "html_url" => html_url,
         "stargazers_count" => stargazers_count
       }
end
