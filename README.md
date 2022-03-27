# 📂 Repository Summary

![GitHub repo size](https://img.shields.io/github/repo-size/joabehenrique/repository-summary?style=flat)
![GitHub language count](https://img.shields.io/github/languages/count/joabehenrique/repository-summary?style=flat)
![GitHub forks](https://img.shields.io/github/forks/joabehenrique/repository-summary?style=flat)
![Bitbucket open issues](https://img.shields.io/bitbucket/issues/joabehenrique/repository-summary?style=flat)
![Bitbucket open pull requests](https://img.shields.io/bitbucket/pr-raw/joabehenrique/repository-summary?style=flat)

> Project developed using the github API to display basic information about your repositories.

## 💻 Requirements

Before you begin, make sure you have met the following requirements:

- You need the latest version of `Elixir/Phoenix` on your machine.

If you need installation instructions, [click here](https://hexdocs.pm/phoenix/installation.html).

## 🚀 Installing Repository Summary

To install Repository Summary, follow these steps:

1º Clone the repository.

```
>  git clone https://github.com/joabehenrique/repository-summary.git
```
2º Open the project in your vscode and run the command
```
> mix deps.get
```
3º Just run project
```
> mix phx.server
```
## ☕ Using Repository Summary

To use Repository Summary, follow these steps:

```
Development project using the Github API, where through 
a request is returned some basic information of the 
repositories of your account.

The project is also a challenge from the elixir 
trail on rocketseat.
```

Getting a repository summary
```
(GET) api/v1/github/user/{username}
```
Create a user
```
(POST) api/v1/github/user/signup

{
  "password": "aduy324!@"
}
```
Log in with your user

*to get the token and access the route from repository summary
```
(POST) api/v1/github/user/signin

{
  "id": 2,
  "password": "aduy324!@"
}
```

## 📫 Contributing to Repository Summary

To contribute to Repository Summary, follow these steps:

1. Fork this repository.
2. Create a branch: `git checkout -b <nome_branch>`.
3. Make your changes and commit them: `git commit -m '<commit_message>'`
4. Send to the original branch: `git push origin Repository Summary / <local>`
5. Create the pull request.

Alternatively, see the GitHub documentation at [how to create a pull request](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request)..

## 🤝 Author and Contributors

We thank the following people who contributed to this project:

<table>
  <tr>
    <td align="center">
      <a href="https://github.com/joabehenrique">
        <img src="https://avatars3.githubusercontent.com/u/64988299" width="100px" style="border-radius: 90px" alt="Foto do Joabe Henrique no GitHub"/><br>
        <sub>
          <b>Joabe Henrique [Author]</b>
        </sub>
      </a>
    </td>
  </tr>
</table>

## 😄 Be one of the contributors<br>

Do you want to be part of this project? Click [here](https://github.com/joabehenrique/repository-summary/blob/master/CONTRIBUTING.md) and read how to contribute.

## 📝 License

This project is under license. See the [license](https://github.com/joabehenrique/repository-summary/blob/master/LICENSE.md) file for more details.
