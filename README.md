

# GitHub Issue Tracker App

This is a Flutter-based GitHub Issue Tracker app that allows users to view, 
search, and filter issues from GitHub repositories. Specifically, 
the app retrieves and displays issues from the `flutter/flutter` repository.

## Features

- **View GitHub Issues**: Users can view a paginated list of issues from the `flutter/flutter` GitHub repository.
- **Search Issues**: Users can search for issues within the repository based on keywords.
- **Filter Issues**: The app automatically filters out issues with the word "flutter" in the title.
- **Issue Details**: Users can tap on any issue to see the full details, formatted in markdown.
- **Bottom Navigation**: Navigate between the issue list and user profile using a bottom navigation bar.
- **Pagination**: Efficiently loads issues as the user scrolls through the list, with support for pagination.
- **Loading Indicators**: A smooth user experience with loaders while issues are being fetched.


## Tech Stack

### Flutter Packages Used:

- **[GetX](https://pub.dev/packages/get)**: For state management, dependency injection, and navigation.
- **[Flutter Markdown](https://pub.dev/packages/flutter_markdown)**: To display issue details formatted in markdown.
- **[http](https://pub.dev/packages/http)**: For making API requests to GitHub's REST API.
- **[Intl](https://pub.dev/packages/intl)**: To format dates properly.

## App Architecture
Followed Clean Code Architecture
This project follows the **Unidirectional Data Flow** 
pattern, where the data is fetched via repositories and passed down to the UI. 
The state is managed by **GetX** controllers for cleaner separation of concerns and reactivity.

### Folder Structure

## Installation and Setup

1. Clone the repository:

   ```bash
   git clone https://github.com/yourusername/github-issue-tracker.git
   ```

2. Navigate to the project directory:

   ```bash
   cd github-issue-tracker
   ```

3. Install dependencies:

   ```bash
   flutter pub get
   ```

4. Run the app on a connected device or emulator:

   ```bash
   flutter run
   ```

## API Integration

This app uses GitHub's REST API to fetch issues from the `flutter/flutter` repository. 
The following endpoints are used:

- **List Issues**: `GET /repos/flutter/flutter/issues`
- **Issue Details**: `GET /repos/flutter/flutter/issues/{issue_number}`

## Usage

### Viewing Issues

- By default, the app fetches and displays issues from the `flutter/flutter` repository.
- Scroll down to load more issues automatically.

### Searching for Issues

- Use the search bar at the top to filter issues based on keywords.
- The app filters the issue titles in real-time as you type.

### View Issue Details

- Tap on any issue in the list to see detailed information, including the description and any markdown content.

## Requirements

- Flutter SDK
- A device or emulator running Android or iOS



#
## Contact

If you have any questions or suggestions, 
feel free to reach out via (mailto:abiabdullahinshaalloh@gmail.com).

---
