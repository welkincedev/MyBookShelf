
# 📚 BookShelf App (Flutter)

A **local-first BookShelf application** built with Flutter that allows users to discover books online, save them locally, track reading progress, and manage their personal library.

---

## 🚀 Project Status

✅ **Phase 1 – Completed**
⏳ Phase 2 – Cloud Sync (Planned)
⏳ Phase 3 – Book Trading & Social Features (Planned)

---

## 🎯 Phase 1 Goal

Build a **single-user, offline-first Flutter app** that enables users to:

* Search books online
* Add books to a personal shelf
* Track reading status
* Mark favorites
* Persist data locally
* Navigate cleanly using Bottom Navigation

---

## 🧱 Tech Stack

* **Flutter (Material UI)**
* **Dart**
* **Google Books API**
* **SharedPreferences** (local storage)
* **Mobile Scanner** (ISBN barcode scanning)

---

## 🗂 Project Structure

```
lib/
├── main.dart
├── models/
│   └── book.dart
├── services/
│   ├── api_service.dart
│   └── local_storage.dart
├── screens/
│   ├── bottom_nav_screen.dart
│   ├── home_screen.dart
│   ├── search_screen.dart
│   ├── shelf_screen.dart
│   ├── book_details_screen.dart
│   ├── add_book_screen.dart
│   ├── scan_book_screen.dart
│   └── profile_screen.dart
```

---

## 🧩 Features Implemented (Phase 1)

### 🏠 Home Screen

* Displays:

  * **Recent Books**
  * **Favorite Books**
* Automatically updates when data changes

---

### 🔍 Search Screen

* Online search using **Google Books API**
* Displays live search results
* Add books directly to shelf
* Floating Action Buttons:

  * ➕ Add book manually
  * 📷 Scan book ISBN barcode

---

### 📚 Shelf Screen

* Displays all saved books
* Shows reading status:

  * Not Started
  * Reading
  * Completed
* Toggle favorite status

---

### 📖 Book Details Screen

* View:

  * Title
  * Author
  * Description
  * Cover image
* Update:

  * Favorite status
  * Reading status

---

### ➕ Add Book Screen

* Manually add books
* Useful for:

  * Regional books
  * Rare books
  * Books unavailable online

---

### 📷 Scan Book Screen

* Scan ISBN barcode using camera
* Fetch book details via Google Books API
* Add scanned book to shelf

---

### 👤 Profile Screen

* Basic placeholder screen
* Reserved for future cloud-based user profiles

---

## 💾 Local Storage

* Uses **SharedPreferences**
* Persists:

  * Book list
  * Favorites
  * Reading status
* Data remains after app restart

---

## 🧠 Key Learnings

* Flutter navigation & BottomNavigationBar
* Asynchronous API handling
* Local persistence
* State management basics
* Debugging real-world Flutter issues
* Clean project architecture

---

## 🚦 Development Phases

| Phase   | Description                    | Status      |
| ------- | ------------------------------ | ----------- |
| Phase 1 | Local, single-user app         | ✅ Completed |
| Phase 2 | Cloud sync & authentication    | ⏳ Planned   |
| Phase 3 | Book trading & social features | ⏳ Planned   |

---

## 🔮 Planned Features

### Phase 2 – Cloud Upgrade

* Firebase Authentication
* Cloud-based book storage
* Reviews & ratings
* Categories & filters

### Phase 3 – Social Features

* Book trading between users
* Trade requests
* Global book feed
* Notifications

---

## ▶️ How to Run the App

```bash
flutter pub get
flutter run
```

---

## 🏁 Final Notes

Phase 1 provides a **solid, scalable foundation** for a future **cloud-based, multi-user BookShelf platform**.
The app is structured to grow naturally into social and trading features.

---

⭐ If you like this project, feel free to star the repository!

---
