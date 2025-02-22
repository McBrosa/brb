#!/bin/bash

# Check if Homebrew is installed
if ! command -v brew > /dev/null; then
  echo "Homebrew is not installed. Please install Homebrew first."
  exit 1
fi

# Check if PostgreSQL is installed
if ! command -v psql > /dev/null; then
  echo "PostgreSQL is not installed. Installing PostgreSQL..."
  brew install postgresql
fi

# Start PostgreSQL service
echo "Starting PostgreSQL service..."
brew services start postgresql

# Wait for PostgreSQL to start by pinging the database
DB_NAME="brb_dev"
DB_USER="postgres"
DB_PASSWORD="postgres"

echo "Waiting for PostgreSQL to start..."
until psql -U $(whoami) -d postgres -c '\q' 2>/dev/null; do
  sleep 1
done

# Check if the postgres role exists
if ! psql -U $(whoami) -d postgres -tc "SELECT 1 FROM pg_roles WHERE rolname='postgres'" | grep -q 1; then
  echo "Creating role postgres..."
  psql -U $(whoami) -d postgres -c "CREATE ROLE postgres WITH LOGIN SUPERUSER PASSWORD '$DB_PASSWORD';"
else
  echo "Role postgres already exists."
fi

# Check if the database exists
if ! psql -U postgres -d postgres -lqt | cut -d \| -f 1 | grep -qw $DB_NAME; then
  echo "Creating database $DB_NAME..."
  createdb -U postgres $DB_NAME
else
  echo "Database $DB_NAME already exists."
fi

echo "PostgreSQL server is running and database $DB_NAME is ready."

# Run migrations to set up the database
echo "Running migrations..."
mix ecto.migrate

echo "Database setup complete."