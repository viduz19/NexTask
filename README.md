# 📌 NexTask – Flutter Task Management App 

## 📖 Overview

**NexTask** is a **mobile-only task management application** built using **Flutter (Dart)**.
This version is **frontend-only**, with all task data stored locally in memory.
It demonstrates clean **UI/UX design**, smooth navigation, and **local state management** for task handling.

The app is perfect for **prototyping, portfolio projects, or internship demonstrations**.

---

## 🚀 Features

### 📝 Task Management (Local)

* Add new tasks with a title and scheduled time
* View all tasks in a single dashboard
* Mark tasks as completed
* Delete tasks
* Tasks are stored in local state (memory) without a backend

### 🎨 UI & UX

* Minimal, modern design using **Material Design**
* Custom color palette:

  * Primary: `#604652`
  * Secondary: `#735557`
  * Accent: `#97866A`
  * Background: `#D29F8F`
* Smooth navigation between screens
* Validation messages for inputs
* Responsive UI elements for mobile screens

---

## 🛠️ Tech Stack

| Technology                                     | Usage                |
| ---------------------------------------------- | -------------------- |
| Flutter                                        | Mobile UI framework  |
| Dart                                           | Programming language |
| Material Design                                | UI components        |
| Local state (`setState` / Provider / Riverpod) | Task management      |

---

## 📱 App Flow

1. **Splash / Welcome Screen** – Shows app name and login button
2. **Login Screen** – Username/email + password input, navigates to dashboard
3. **Sign Up Screen** – Username, password, confirm password, navigates to dashboard
4. **Task Dashboard** – Displays task list, allows adding, completing, and deleting tasks
5. **Add Task Modal/Screen** – Input task title and scheduled time

---

## ⚙️ Setup Instructions

1. Clone the repository:

   ```bash
   git clone https://github.com/viduz19/NexTask.git
   ```
2. Open the project in **Android Studio** or **VS Code**
3. Get dependencies:

   ```bash
   flutter pub get
   ```
4. Run the app on a simulator or device:

   ```bash
   flutter run
   ```

---

## 🎯 Purpose

* Practice Flutter UI development and mobile design
* Implement **local state management** for tasks
* Build a **portfolio-ready frontend application**

---

## 📌 Future Enhancements

* Connect to Firebase or another backend for persistent storage
* Add task priority levels
* Add task editing
* Push notifications
* Dark mode option
* Offline support

---

## 👤 Author

**Vidusha Puswalkatiya**
Flutter Mobile Developer


