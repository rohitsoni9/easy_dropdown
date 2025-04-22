# Flutter Easy Dropdown Example

This example demonstrates how to use the `flutter_easy_dropdown` package in both offline and online modes.

## Features Demonstrated

1. Offline Dropdown
   - Using a local list of items
   - Search functionality
   - Custom item display

2. Online Dropdown
   - Fetching data from an API
   - Real-time search filtering
   - Custom item display with additional information

## How to Run

1. Make sure you have Flutter installed on your system
2. Navigate to the example directory:
   ```bash
   cd example
   ```
3. Get the dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run
   ```

## Example Code Structure

The example consists of a single screen with two dropdowns:

1. **Offline Dropdown**: Uses a local list of countries
2. **Online Dropdown**: Fetches user data from JSONPlaceholder API

Each dropdown demonstrates:
- Search functionality
- Custom item display
- Selection handling
- State management

## Dependencies

- flutter_easy_dropdown: The main package being demonstrated
- dio: For making HTTP requests in the online example 