📌 NexTask – Flutter Task Management App
📖 Overview

NexTask is a modern, mobile-only task management application built using Flutter (Dart) and Firebase.
The app helps users organize daily tasks efficiently with a clean user interface, real-time updates, and secure authentication.

NexTask is designed as an MVP-level productivity app, focusing on simplicity, usability, and scalability.

🚀 Features
🔐 Authentication

User Sign Up

User Login

Secure Firebase Authentication

User-specific task access

📝 Task Management

Add new tasks with scheduled time

View all tasks in a single dashboard

Mark tasks as completed

Delete tasks

Real-time task updates using Firestore

🎨 UI & UX

Clean and minimal Material UI

Custom color palette:

#604652 (Primary)

#735557 (Secondary)

#97866A (Accent)

#D29F8F (Background)

Smooth navigation and intuitive user flow

🛠️ Tech Stack
Technology	Usage
Flutter	Mobile UI Framework
Dart	Programming Language
Firebase Authentication	User Authentication
Cloud Firestore	Real-time Database
Material Design	UI Components
📱 App Flow

Splash / Welcome Screen

Login Screen

Sign Up Screen

Task Dashboard

Add / Complete / Delete Tasks

Each user can only manage their own tasks securely.

🗂️ Database Structure (Firestore)
users (collection)
 └── userId (document)
     ├── username: string
     └── createdAt: timestamp

tasks (collection)
 └── taskId (document)
     ├── userId: string
     ├── title: string
     ├── scheduledTime: timestamp
     ├── status: "todo" | "completed"
     └── createdAt: timestamp

🔐 Security

Firebase Authentication required for all operations

Firestore rules ensure users access only their own tasks

Real-time updates with secure read/write permissions

⚙️ Setup Instructions

Clone the repository

git clone https://github.com/your-username/nextask.git


Open the project in Android Studio or VS Code

Create a Firebase project

Enable:

Email/Password Authentication

Cloud Firestore

Add google-services.json to the Android app

Run the app:

flutter pub get
flutter run

🎯 Purpose

This project was developed to:

Practice Flutter mobile development

Implement Firebase Authentication and Firestore

Build a real-world task management application

Serve as a portfolio and internship-ready project

📌 Future Enhancements

Task priority levels

Task editing

Push notifications

Dark mode

Offline support

👤 Author

Sanduni Vidusha
Flutter Mobile Developer
