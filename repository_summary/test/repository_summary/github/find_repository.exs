defmodule RepositorySummary.FindRepositoryTest do
  use ExUnit.Case, async: true

  alias RepositorySummary.FindRepository

  describe "call/1" do
    setup do
      bypass = Bypass.open()

      {:ok, bypass: bypass}
    end

    test "when there is a valid username, returns the repository summary", %{bypass: bypass} do
      username = "joabehenrique"

      url = endpoint_url(bypass.port)

      body =
        Jason.encode!([
          %{
            created_at: "2022-01-20T16:25:28",
            description: nil,
            html_url: "https://github.com/joabehenrique/repository-summary",
            id: 76_972_604,
            language: nil,
            name: "repository-summary",
            stargazers_count: 0
          }
        ])

      Bypass.expect(bypass, "GET", "#{username}/repos", fn conn ->
        conn
        |> Plug.Conn.put_resp_header("content-type", "application/json")
        |> Plug.Conn.resp(200, body)
      end)

      response = FindRepository.call(url, username)

      expected_response =
        {:ok,
         [
           %{
             "description" => nil,
             "html_url" => "https://github.com/joabehenrique/repository-summary",
             "id" => 76_972_604,
             "name" => "repository-summary",
             "stargazers_count" => 0
           }
         ]}

      assert expected_response == response
    end

    test "when the username is invalid, returns an error", %{bypass: bypass} do
      username = "fabricionandolfo2"

      url = endpoint_url(bypass.port)

      body =
        ~s({ "message": "Not Found", "documentation_url": "https://docs.github.com/rest/reference/repos#list-repositories-for-a-user"})

      Bypass.expect(bypass, "GET", "#{username}/repos", fn conn ->
        conn
        |> Plug.Conn.put_resp_header("content-type", "application/json")
        |> Plug.Conn.resp(404, body)
      end)

      response = FindRepository.call(url, username)

      expected_response =
        {:error,
         %RepositorySummary.Error{
           result: "Repository Owner not found",
           status: :not_found
         }}

      assert expected_response == response
    end

    defp endpoint_url(port), do: "http://localhost:#{port}/"
  end
end
