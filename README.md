# 🍽️ Menu App (Flutter + BLoC)

A Flutter application for Resturent management assignment. Built using Flutter and BLoC for clean state management.

---

## 🛠️ Getting Started



### 📦 Clone the Repository

```
Clone the repository
```

---

### 🔧 Install Dependencies

```
flutter pub get
```

---

### ▶️ Run the App

```
flutter run
```

This will launch the app on your connected emulator or physical device.

---

## 🧩 Folder Structure

```
lib/
├── data/                     # Dummy/mock data
├── fetures/
│   ├── Category/             # Category UI & model
│   └── MenuItem/
│       ├── bloc/             # BLoC logic
│       └── ui/               # Main UI screens
└── main.dart                 # Entry point
```

---


## 🧠 State Management

This app uses the `flutter_bloc` package for state management:

- Bloc events trigger tab selection and counter changes
- Bloc states emit the current view (ingredients, nutrition, etc.)

---


