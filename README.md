# Elixir Chat Application

This is a simple chat application built with Elixir and Phoenix. It allows users to communicate in real-time using WebSockets.

## Features

- Real-time messaging
- User authentication
- Simple and intuitive interface

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/nrosa/brb.git
   ```

2. Navigate into the project directory:

   ```bash
   cd brb
   ```

3. Install the dependencies:

   ```bash
   mix deps.get
   ```

4. Compile the dependencies:

   ```bash
   mix deps.compile
   ```

5. Set up the database:

   ```bash
   mix ecto.create
   ```

6. Start database

   ```bash
   brew services start postgresql
   ```

## Running the Application

To start the application, run:

```bash
mix phx.server
```

You can then access the chat application at `http://localhost:4000`.

## Running Tests

To run the test suite, use the following command:

```bash
mix test
```

## Contributing

Feel free to submit issues or pull requests if you have suggestions or improvements for the project.

## License

This project is open-source and available under the MIT License.