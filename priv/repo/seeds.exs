# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Splitwise.Repo.insert!(%Splitwise.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Splitwise.Accounts

# Create sample users with all required fields
users = [
  %{
    email: "john@example.com",
    name: "John Doe",
    password_hash: "password123",
    api_key: Ecto.UUID.generate(),
    api_key_expires_at: DateTime.add(DateTime.utc_now(), 30, :day)
  },
  %{
    email: "jane@example.com",
    name: "Jane Smith",
    password_hash: "password123",
    api_key: Ecto.UUID.generate(),
    api_key_expires_at: DateTime.add(DateTime.utc_now(), 30, :day)
  },
  %{
    email: "bob@example.com",
    name: "Bob Johnson",
    password_hash: "password123",
    api_key: Ecto.UUID.generate(),
    api_key_expires_at: DateTime.add(DateTime.utc_now(), 30, :day)
  },
  %{
    email: "alice@example.com",
    name: "Alice Brown",
    password_hash: "password123",
    api_key: Ecto.UUID.generate(),
    api_key_expires_at: DateTime.add(DateTime.utc_now(), 30, :day)
  },
  %{
    email: "charlie@example.com",
    name: "Charlie Wilson",
    password_hash: "password123",
    api_key: Ecto.UUID.generate(),
    api_key_expires_at: DateTime.add(DateTime.utc_now(), 30, :day)
  }
]

# Insert users and handle any errors
Enum.each(users, fn user_attrs ->
  case Accounts.create_user_default(user_attrs) do
    {:ok, user} ->
      IO.puts("Created user: #{user.email}")

    {:error, changeset} ->
      IO.puts("Error creating user #{user_attrs.email}: #{inspect(changeset.errors)}")
  end
end)

IO.puts("User seed data creation completed!")
