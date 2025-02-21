# filepath: /elixir-chat-app/elixir-chat-app/test/test_helper.exs
ExUnit.start()

# Load the configuration for the test environment
Mix.Task.run("app.start")

# Set the sandbox mode for the database if using Ecto
Ecto.Adapters.SQL.Sandbox.mode(MyApp.Repo, :manual)