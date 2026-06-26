# Flutter Practice Application
### Overview
Flutter Practice Application is a learning project designed to help Flutter developers understand and practice important Flutter development concepts, including:
- Provider State Management
- MVVM (Model-View-ViewModel) Architecture
- REST API Integration
- Dynamic UI Updates
- Navigation Between Screens

The application contains four pages:
- Login Page
- Profile Page
- Notes Page
- Quotes Page

The project demonstrates how to build a structured Flutter application using the MVVM architecture and Provider for state management while consuming data from external APIs.

## Features
### Notes Management
- Create notes
- Display notes
- Delete notes
- State management using provider

### Quotes Page
- Fetch quotes from a public API
- Display quotes in a list
- Handle loading and error states

### Profile Page
- Dynamic UI updates
- User information display

### Authentication
- Simple login flow for learning purposes

## Technologies Used
- Flutter
- Dart
- Provider
- HTTP Package
- MVVM Architecture

## Project Structure
```text
lib/
├── model/
│   └── quotes_model.dart
|
├── services/
│   └── quotes_service.dart
|
├── view/
│   ├── login_view.dart
│   ├── profile_view.dart
│   ├── note_view.dart
│   └── quotes_view.dart
│
├── viewmodel/
│   ├── notes_viewmodel.dart
│   └── quotes_viewmodel.dart
│
└── main.dart
```

<img src="images/Project Structure.png" alt="Project Structure" width="700">

### Model
Represents the application's data structures.

### View
Contains the user interface and displays data to the user.

### ViewModel
Handles business logic and manages communication between the View and Model.

### Service
Responsible for API requests and external data access.

## External Resources
The APIs used in this application are provided by [DummyJSON](https://dummyjson.com/).
- [DummyJSON](https://dummyjson.com/)
- [Quotes API Documentation](https://dummyjson.com/docs/quotes)

## Resources
- [Flutter Networking Documentation](https://docs.flutter.dev/data-and-backend/networking)
- [Flutter Provider Documentation](https://docs.flutter.dev/data-and-backend/state-mgmt/simple)
- [Flutter Architecture Guide](https://docs.flutter.dev/app-architecture/guide)
- [Flutter MVVM Case Study](https://docs.flutter.dev/app-architecture/case-study)
