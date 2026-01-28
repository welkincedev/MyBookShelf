# 📚 BookShelf App – Product Requirements Document (PRD)

## 1. Overview
**Product Name:** BookShelf  
**Platform:** Android (Flutter)  
**Stage:** MVP (Phase 2 – Authentication + Core Features)

BookShelf is a personal book management mobile application that allows users to save, search, and organize books into shelves. The initial release focuses on offline-first functionality with simulated authentication, preparing the app for future Firebase-based real authentication and cloud sync.

---

## 2. Problem Statement
Many readers struggle to:
- Keep track of books they own or want to read
- Organize books by status (read, reading, wishlist)
- Access a simple, distraction-free personal library app

Existing solutions are either:
- Overloaded with social features
- Require mandatory sign-in
- Not optimized for offline usage

---

## 3. Goals & Objectives

### Primary Goals
- Provide a clean, fast personal book tracking app
- Allow users to manage books offline
- Prepare architecture for future authentication and cloud sync

### Success Metrics
- App launches without crashes
- User can add, search, and manage books
- Login/logout flow works smoothly (simulated)
- Data persists locally

---

## 4. Target Users

### Primary Users
- Students
- Avid readers
- Casual readers managing personal collections

### User Characteristics
- Android users
- Prefer simple UI
- Offline-friendly usage

---

## 5. User Personas

**Persona 1: Student Reader**  
- Wants to track academic and leisure books  
- Uses app offline

**Persona 2: Casual Reader**  
- Wants a wishlist and reading status

---

## 6. Core Features (MVP)

### 6.1 Authentication (Phase 2.2 – Current)
- Simulated Login & Signup (front-end only)
- Local auth state persistence
- Logout functionality
- Profile screen displaying user info

> Note: No backend or Firebase dependency in MVP

---

### 6.2 Home Screen
- Display list of saved books
- Recently added books
- Ability to update book status

---

### 6.3 Search Screen
- Search books by title or author
- Filter results dynamically

---

### 6.4 Shelf Screen
- Categorized shelves:
  - Reading
  - Completed
  - Wishlist
- Persistent local storage

---

### 6.5 Profile Screen
- User name & email (mock data)
- Logout button
- Future placeholder for settings

---

## 7. Non-Functional Requirements

### Performance
- App launch time < 3 seconds
- Smooth scrolling

### Reliability
- Offline-first behavior
- No data loss on app restart

### Maintainability
- Clean folder structure
- Separation of UI, models, and services

---

## 8. Technical Architecture

### Frontend
- Flutter (Material UI)

### State Management
- Stateful Widgets (MVP)
- Ready for Provider/Riverpod upgrade

### Storage
- Local Storage (SharedPreferences / local JSON)

### Authentication
- Simulated (Local flag-based auth)

---

## 9. Navigation Structure

- Bottom Navigation Bar
  - Home
  - Search
  - Shelf
  - Profile

Authentication gate:
- Login → BottomNavScreen
- Logout → Login Screen

---

## 10. Data Models

### Book Model
- id
- title
- author
- status (reading/completed/wishlist)

### User Model (Simulated)
- name
- email
- isLoggedIn

---

## 11. Out of Scope (MVP)

- Social sharing
- Ratings & reviews
- Cloud sync
- Payments
- Ads

---

## 12. Risks & Mitigation

| Risk | Mitigation |
|-----|-----------|
| Android build issues | Gradle + namespace alignment |
| Data loss | Local persistence testing |
| Auth complexity | Simulated auth first |

---

## 13. Future Roadmap

### Phase 3
- Firebase Authentication
- Firestore sync
- Multi-device support

### Phase 4
- UI/UX polish
- Dark mode
- Backup & restore

---

## 14. Acceptance Criteria

- App installs and launches successfully
- User can login/logout
- Books persist after restart
- Bottom navigation works correctly

---

## 15. Conclusion

BookShelf MVP focuses on reliability, simplicity, and a strong technical foundation. The current phase validates navigation, local storage, and authentication flow, enabling smooth transition to a full backend-powered version in future releases.

