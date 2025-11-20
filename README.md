# Flutter Quick Notes App
A clean and simple Notes App built using Flutter + Riverpod + MVVM + Shared Preferences.

## Features
1. Add new notes
2. Edit existing notes
3. Delete notes
4. Search notes
5. Local storage using shared_preferences
6. Clean MVVM architecture

## Installation
Clone the repository:
```sh
git clone <your-repo-url>
```
## Navigate to the project folder:
```sh
cd quick_notes
```

## Install dependencies:
```sh
flutter pub get
```

## Run the app:
```sh
flutter run
```

# Or

Follow the official Flutter installation guide:
### 1. Create a new Flutter project 
```sh
flutter create quick_notes
```
### 2. Replace the lib folder
Substitute the default lib directory with the provided tutorial codebase.


## Project Structure
```plaintext
lib/
 ├── models/
 │     └── note.dart
 ├── services/
 │     └── storage_service.dart
 ├── view/
 │     ├── home_screen.dart
 │     └── add_edit_screen.dart
 ├── view_model/
 │     └── notes_view_model.dart
 └── main.dart
```

## Dependencies
```plaintext
dependencies:
  flutter:
    sdk: flutter
  flutter_riverpod: ^2.4.0
  shared_preferences: ^2.2.2
Run:
flutter pub get
```

## Architecture (MVVM + Riverpod)
Model → Note data class
1. ViewModel → StateNotifier managing CRUD + search
2. View → UI screens listening to provider states
3. Service → Handles shared_preferences read/write

## Local Storage (Shared Preferences)
Notes are saved as a JSON encoded list:

```plaintext
[
  {
    "id": "123",
    "title": "Sample Note",
    "content": "Hello world",
    "createdAt": "2025-01-20T10:00:00Z"
  }
]
```

## Running the App
```sh
flutter run
```
## Demo
https://github.com/user-attachments/assets/f5b0e0ba-4078-4b59-9270-a31e7acea511

## About Me 
✨ I’m **Sufyan bin Uzayr**, an open-source developer passionate about building and sharing meaningful projects.
You can learn more about me and my work at [sufyanism.com](https://sufyanism.com/) or connect with me on [Linkedin](https://www.linkedin.com/in/sufyanism)

## Your all-in-one learning hub! 
🚀 Explore courses and resources in coding, tech, and development at **zeba.academy** and **code.zeba.academy**. Empower yourself with practical skills through curated tutorials, real-world projects, and hands-on experience. Level up your tech game today! 💻✨

**Zeba Academy**  is a learning platform dedicated to **coding**, **technology**, and **development**.  
➡ Visit our main site: [zeba.academy](https://zeba.academy)   <br/>
➡ Explore hands-on courses and resources at: [code.zeba.academy](https://code.zeba.academy)   <br/>
➡ Check out our YouTube for more tutorials: [zeba.academy](https://www.youtube.com/@zeba.academy)  <br/>
➡ Follow us on Instagram: [zeba.academy](https://www.instagram.com/zeba.academy/)  <br/>

**Thank you for visiting!**






