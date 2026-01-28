# 📚 BookShelf (Flutter)

A **local-first BookShelf app** built with Flutter to search books online, save them locally, and manage personal reading progress.

---

## 🚀 Project Status

- ✅ **Phase 1:** Local single-user app (Completed)
- ⏳ **Phase 2:** Cloud sync & authentication (Planned)
- ⏳ **Phase 3:** Social & book trading features (Planned)

---

## 🎯 Phase 1 Features

- 🔍 Search books using **Google Books API**
- 📚 Save books to a personal shelf (offline)
- ❤️ Mark favorites
- 📖 Track reading status (Not Started / Reading / Completed)
- ➕ Add books manually
- 📷 Scan ISBN barcodes
- 🧭 Clean navigation with Bottom Navigation
- 💾 Persistent local storage

---

## 🧱 Tech Stack

- Flutter (Material UI)
- Dart
- Google Books API
- SharedPreferences
- Mobile Scanner (ISBN)

---

## 🗂 Project Structure

MyBookShelf/
│
├── android/                 # Android platform code (Gradle, Manifest, etc.)
├── ios/                     # iOS platform code
├── lib/                  
│   ├── main.dart
│   │
│   ├── models/
│   │   └── book.dart
│   │
│   ├── services/
│   │   ├── local_storage.dart
│   │   └── auth_service.dart   # simulated auth
│   │
│   ├── screens/
│   │   ├── login_screen.dart
│   │   ├── signup_screen.dart
│   │   ├── bottom_nav_screen.dart
│   │   ├── home_screen.dart
│   │   ├── search_screen.dart
│   │   ├── shelf_screen.dart
│   │   └── profile_screen.dart
│   │
│   └── widgets/             # reusable UI components (optional)
│
├── pubspec.yaml
├── pubspec.lock
├── README.md               
├── .gitignore
└── analysis_options.yaml



## 🔮 Roadmap

#Phase 2

- Firebase Authentication
- Cloud-based book sync
- Filters & categories
  
#Phase 3

- Book trading
- Social feed
- Notifications

---

### Why this version works
- ✅ Short & scannable
- ✅ Perfect for recruiters
- ✅ Easy to maintain
- ✅ Still shows vision + roadmap

If you want, I can also:
- Make an **ultra-minimal (10–12 lines)** version  
- Add **badges (Flutter, Firebase, Version)**  
- Write a **release note for v1.0.0**

Just tell me 👌
