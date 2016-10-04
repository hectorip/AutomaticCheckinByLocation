# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Boilerplate.Repo.insert!(%Boilerplate.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Boilerplate.Repo
alias Boilerplate.User

user_data = %{username: "admin", email: "somemail@gmail.com", password: "123456", status: 1}
changeset = User.registration_changeset(%User{}, user_data)
Repo.insert! changeset