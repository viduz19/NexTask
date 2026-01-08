# 📌 NexTask – Full-Stack Task Management App

## 📖 Overview

**NexTask** is a premium, full-stack task management application designed for modern efficiency. It combines a high-performance **Flutter** mobile experience with a robust **Node.js & MongoDB** backend.

Unlike basic task apps, NexTask features real-time synchronization, advanced task categorization (Ongoing, Pending, Ended), a dedicated focus timer (Stopwatch), and a database-integrated notification system.

---

## 🚀 Key Features

### � Advanced Task Management
* **Categorized Workflow**: Organize tasks into **Ongoing**, **Pending**, and **Ended** sections.
* **Full CRUD**: Create, Read, Update, and Delete tasks with instant cloud sync.
* **Smart Search**: Real-time task filtering directly from the dashboard.
* **Quick Status Toggle**: Mark tasks as ongoing or completed with a single tap.

### ⏱️ Time Tracking (Stopwatch)
* **Dedicated Timer**: Track exactly how much time you spend on each task.
* **Mini Dashboard Widget**: Access a focus timer without leaving your main view.
* **Backend Persistance**: Total time spent is synced to your profile.

### 🔔 Integrated Notification System
* **Alerts & Reminders**: Get notified about upcoming deadlines and overdue tasks.
* **Sync with Backend**: Notifications are stored in the database, allowing for cross-device visibility.
* **Read Status**: Track and manage your notification history.

### 🔐 Secure Authentication
* **JWT-Based Login**: Industry-standard secure authentication.
* **User Profiles**: Personalized experience with profile customization and theme settings.

### 🎨 Premium UI/UX
* **Modern Material 3**: Beautiful, responsive design with smooth micro-animations.
* **Adaptive Theme**: One-tap toggle between **Light** and **Dark** modes.
* **Glassmorphism Elements**: Sleek, modern aesthetics for a premium feel.

---

## 🛠️ Architechture & Tech Stack

### Frontend (Mobile)
* **Framework**: Flutter
* **Language**: Dart
* **State Management**: Provider
* **Networking**: HTTP for REST API consumption

### Backend (Server)
* **Runtime**: Node.js
* **Framework**: Express.js
* **Database**: MongoDB Atlas (Cloud)
* **Security**: JWT & Bcrypt.js

---

## ⚙️ Setup & Installation

### 1. Prerequisities
- Flutter SDK installed
- Node.js installed
- MongoDB Atlas account (or local MongoDB)

### 2. Backend Setup
1. Navigate to the `backend` directory:
   ```bash
   cd backend
   ```
2. Install dependencies:
   ```bash
   npm install
   ```
3. Create a `.env` file in the `backend` folder:
   ```env
   PORT=5000
   MONGODB_URI=your_mongodb_connection_string
   JWT_SECRET=your_secret_key
   ```
4. Start the server:
   ```bash
   npm start
   ```

### 3. Frontend Setup
1. From the project root, install Flutter packages:
   ```bash
   flutter pub get
   ```
2. Update the `baseUrl` in `lib/services/api_service.dart` if running on a real device.
3. Run the app:
   ```bash
   flutter run
   ```

---

## 🎯 Project Goals
* Demonstrate full-stack integration for mobile applications.
* Implement professional-grade authentication and data persistence.
* Showcase advanced UI concepts and efficient state management.

---

## 👤 Author

**Vidusha Puswalkatiya**
*Advanced Mobile Development Student*

---

Designed with ❤️ for NexTask.
