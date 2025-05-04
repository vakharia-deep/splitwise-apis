defmodule Splitwise.Repo.Migrations.SeedUsers do
  use Ecto.Migration

  def up do
    # Create sample users with all required fields
    users = [
      %{
        email: "john@example.com",
        name: "John Doe",
        password_hash: "password123",
        api_key: Ecto.UUID.generate(),
        api_key_expires_at: DateTime.add(DateTime.utc_now(), 30, :day),
        inserted_at: NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second),
        updated_at: NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second)
      },
      %{
        email: "jane@example.com",
        name: "Jane Smith",
        password_hash: "password123",
        api_key: Ecto.UUID.generate(),
        api_key_expires_at: DateTime.add(DateTime.utc_now(), 30, :day),
        inserted_at: NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second),
        updated_at: NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second)
      },
      %{
        email: "bob@example.com",
        name: "Bob Johnson",
        password_hash: "password123",
        api_key: Ecto.UUID.generate(),
        api_key_expires_at: DateTime.add(DateTime.utc_now(), 30, :day),
        inserted_at: NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second),
        updated_at: NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second)
      },
      %{
        email: "alice@example.com",
        name: "Alice Brown",
        password_hash: "password123",
        api_key: Ecto.UUID.generate(),
        api_key_expires_at: DateTime.add(DateTime.utc_now(), 30, :day),
        inserted_at: NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second),
        updated_at: NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second)
      },
      %{
        email: "charlie@example.com",
        name: "Charlie Wilson",
        password_hash: "password123",
        api_key: Ecto.UUID.generate(),
        api_key_expires_at: DateTime.add(DateTime.utc_now(), 30, :day),
        inserted_at: NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second),
        updated_at: NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second)
      }
    ]

    # Insert users directly into the database
    Enum.each(users, fn user ->
      execute """
      INSERT INTO users (email, name, password_hash, api_key, api_key_expires_at, inserted_at, updated_at)
      VALUES (
        '#{user.email}',
        '#{user.name}',
        '#{user.password_hash}',
        '#{user.api_key}',
        '#{user.api_key_expires_at}',
        '#{user.inserted_at}',
        '#{user.updated_at}'
      )
      ON CONFLICT (email) DO NOTHING;
      """
    end)
  end

  def down do
    # Remove the seeded users
    execute """
    DELETE FROM users
    WHERE email IN (
      'john@example.com',
      'jane@example.com',
      'bob@example.com',
      'alice@example.com',
      'charlie@example.com'
    );
    """
  end
end
