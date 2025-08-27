# DotNetLibrary

A sample .NET 8 class library project with unit tests using NUnit.

## Projects
- **DotNetLibrary.Library**: Main class library containing reusable code.
- **DotNetLibrary.Test**: NUnit test project for unit testing the library.

## Features
- Example `Calculator` class with an `Add` method.
- NUnit-based unit tests for the `Calculator` class.
- Uses MinVer for versioning.
- XML documentation generation enabled.

## Getting Started
1. Clone the repository:
   ```sh
   git clone git@github.com:mominmaaz/dotnet-library.git
   ```
2. Build the solution:
   ```sh
   dotnet build
   ```
3. Run tests:
   ```sh
   dotnet test DotNetLibrary.Test
   ```

## Versioning
This project uses [MinVer](https://github.com/adamralph/minver) for automatic versioning based on Git tags.

## License
MIT
