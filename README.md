# Flutter User List App

A Flutter mobile application that fetches and displays a list of users from a public API with pagination, search, and detail viewing functionality.

---

## 📱 Features

- **User List Screen**  
  Displays a scrollable list of users fetched from the API with their name and profile picture.

- **User Detail Screen**  
  On selecting a user, navigates to a detail screen showing the user's full profile including:
  - Profile picture
  - Name
  - Email
  - Location

- **Search Functionality**  
  A search bar allows filtering users by name **locally** from the already fetched data.

- **Infinite Scroll Pagination**  
  Loads users in batches using the API’s pagination system. Automatically fetches the next page as the user scrolls near the bottom.

---

## 🔧 Technical Stack

| Component       | Technology             |
|-----------------|------------------------|
| UI Framework    | Flutter                |
| State Management| Riverpod               |
| Networking      | Dio                    |
| Architecture    | Clean Architecture     |
| Pagination      | Server-side via API    |
| API Source      | [https://api.github.com/users]|

---

## 🛠 Feature Generator Script

To streamline development and enforce consistent folder structure, a shell script is included to generate new feature modules.

### 🔧 Usage

```bash
./generate_feature.sh <feature_name>

🗂️ Example
./generate_feature.sh profile

This will generate:
lib/features/profile/
├── data/
│   └── profile_repository.dart
├── domain/
│   └── profile_model.dart
├── presentation/
│   └── profile_screen.dart
├── providers/
│   └── profile_provider.dart
├── widgets/

🚨 Notes
	•	Ensure the script has execution permission: chmod +x generate_feature.sh
	•	Use lowercase snake_case or camelCase naming for features.