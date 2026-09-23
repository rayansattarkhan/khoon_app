# Khoon App — Architecture & Project Layout

This document provides a comprehensive overview of the **Khoon App** architecture, directory layout, design system, data flow, and key application modules.

---

## 1. Overview & Tech Stack

**Khoon App** is a Flutter mobile application designed for blood donation and request management. It enables users to register as donors, request blood during emergencies, track blood availability, and communicate via message threads.

### Tech Stack

| Layer / Aspect | Technology / Library | Description |
| :--- | :--- | :--- |
| **Framework** | Flutter (Dart SDK `^3.13.0`) | Cross-platform mobile development (Android & iOS) |
| **Backend / Auth** | Firebase (`firebase_core: ^4.14.0`, `firebase_auth: ^6.7.0`) | User authentication and Firebase app initialization |
| **UI Paradigm** | Material Design 3 (`useMaterial3: true`) | Modern Material components with custom theme configurations |
| **Typography** | Custom Font Family (`Arial`, Regular & Bold) | Custom asset-based font styling |
| **Architecture Pattern** | MVVM (Model-View-ViewModel) + Modular UI | Separation of presentation, business logic/view models, and core theme/components |

---

## 2. Directory Layout & Architecture Overview

The codebase is organized into a feature-aware **MVVM Architecture** under the `lib/` directory:

```
khoon_app/
├── android/                        # Native Android configuration & Gradle files
├── ios/                            # Native iOS configuration & Xcode project files
├── assets/                         # Static assets (fonts, images, icons)
│   ├── fonts/                      # Arial_Regular.ttf, Arial_Bold.ttf
│   └── images/                     # App icons, splash, logos, request images
├── lib/                            # Application Source Code
│   ├── main.dart                   # Entry point, Firebase init & MaterialApp setup
│   ├── firebase_options.dart       # Firebase configuration per platform
│   ├── core/                       # Core shared utilities, themes, and UI widgets
│   │   ├── theme/                  # App themes and design tokens
│   │   │   ├── my_themes.dart      # ThemeData configuration (Light & Dark)
│   │   │   └── theme_constants/    # Color constants and text color definitions
│   │   │       ├── my_colors.dart
│   │   │       └── my_text_colors.dart
│   │   └── ui_components/          # Reusable, atomic UI widgets
│   │       ├── buttons/            # Custom buttons (Primary, Action, Outlined, Circular, Request buttons)
│   │       ├── cards/              # Domain-specific cards (Blood Availability, Request, Donation, Message Threads)
│   │       ├── charts/             # Custom chart components (e.g., SingleBarChart)
│   │       └── snackbars/          # Custom notification snackbars
│   ├── model/                      # Data models and entity representations
│   ├── view_models/                # ViewModels, Auth logic, and App Constants
│   │   ├── auth/                   # Authentication logic (FirebaseUser wrapper)
│   │   ├── constants/              # Enums & Domain constants (Blood Groups, Online Status)
│   │   └── donor_availability/     # Donor availability state definitions
│   └── views/                      # UI Screens & Navigation Views
│       ├── splash_screen.dart      # Initial splash screen
│       ├── auth/                   # Sign In & Registration screens
│       │   ├── sign_in_screen.dart
│       │   └── register_screen.dart
│       ├── home_navigation_bar/    # Main App Navigation Shell (Bottom Navigation Bar)
│       │   ├── home_navigation_bar.dart
│       │   └── screens/            # Main tabs inside bottom navigation
│       │       ├── dashboard_screen.dart
│       │       ├── requests_screen.dart
│       │       ├── chats_screen.dart
│       │       └── profile_screen.dart
│       ├── message_threads/        # Messaging screen and thread view
│       └── requests_screens/       # Detailed flow screens for posting requests/donations
│           ├── request_blood_screen.dart
│           ├── donate_blood_screen.dart
│           ├── post_blood_request_screen.dart
│           └── post_donation_availability_screen.dart
├── pubspec.yaml                    # Dependencies, assets, and font declarations
└── firebase.json                   # Firebase CLI project configuration
```

---

## 3. Core Architectural Modules

```mermaid
graph TD
    A[main.dart] --> B[Firebase Initialization]
    A --> C[KhoonApp MaterialApp]
    C --> D[SplashScreen]
    D -->|Navigate| E[SignInScreen]
    E -->|Authenticate via FirebaseUser| F[Firebase Auth]
    E -->|On Success| G[HomeNavigationBar Shell]
    G --> H[DashboardScreen]
    G --> I[RequestsScreen]
    G --> J[ChatsScreen]
    G --> K[ProfileScreen]

    H --> L[Core UI Components / Cards & Charts]
    I --> M[Requests Screens / Donate & Post Request]
    J --> N[Message Threads View]
    
    subgraph Core Layer
        O[MyThemes / MyColors / MyTextColors]
        P[Reusable UI Components: Buttons, Cards, Snackbars]
    end

    subgraph ViewModel Layer
        Q[FirebaseUser - Auth Business Logic]
        R[DonorAvailability State]
        S[BloodGroups & OnlineStatus Constants]
    end

    G -. Uses .-> Core Layer
    H -. Reads .-> ViewModel Layer
```

### 3.1 `core/` (Design System & Reusable UI)
- **`theme/`**:
  - `my_colors.dart`: Centralized color palette including brand reds (`brightRed`, `lightRed`), status greens, dark/light neutrals, and card background tones.
  - `my_text_colors.dart`: Text color tokens for accessibility and brand consistency.
  - `my_themes.dart`: Configures `ThemeData` for light/dark themes, custom font families (`Arial`), and `TextTheme` specifications.
- **`ui_components/`**:
  - **Buttons**: Reusable modular buttons (`PrimaryButton`, `ActionButton`, `OutlinedButton`, `CircularButton`, `CallButton`, `ChatButton`).
  - **Cards**: `BloodAvailabilityCard`, `BloodDonationCard`, `BloodRequestCard`, `MessageBoxCard`, `ReceivedMessageThreadCard`, `SentMessageThreadCard`.
  - **Charts**: Custom bar charts like `SingleBarChart` used for visual dashboard statistics.

### 3.2 `view_models/` (Business Logic & State)
- **`auth/auth.dart` (`FirebaseUser`)**: Static service wrapper around `FirebaseAuth.instance` managing user creation (`createUserWithEmailAndPassword`), sign-in (`signInUserWithEmailAndPassword`), and sign-out operations.
- **`constants/`**:
  - `blood_groups.dart`: Centralized list/enum of blood types (`A+`, `A-`, `B+`, `B-`, `AB+`, `AB-`, `O+`, `O-`).
  - `online_status.dart`: Donor online availability status definitions.
- **`donor_availability/`**: Holds state flags for donor status across the app.

### 3.3 `views/` (Presentation & Navigation)
- **`splash_screen.dart`**: Animated entry screen that transitions to `SignInScreen` after initialization.
- **`auth/`**:
  - `sign_in_screen.dart`: Handles user authentication inputs, validations, and Firebase authentication triggering.
  - `register_screen.dart`: Registration screen for onboarding new donors and requestors.
- **`home_navigation_bar/`**:
  - `home_navigation_bar.dart`: Custom persistent bottom navigation bar providing seamless switching between the 4 primary tabs:
    1. **Dashboard (`dashboard_screen.dart`)**: Quick metrics (open requests, available donors, saved lives counter, high demand blood group statistics, and status card).
    2. **Requests (`requests_screen.dart`)**: View current active blood requests and donation options.
    3. **Chats (`chats_screen.dart`)**: Message list and ongoing communication threads.
    4. **Profile (`profile_screen.dart`)**: User profile, donor availability toggle, and account settings.
- **`requests_screens/`**: Form screens for posting new blood requests (`post_blood_request_screen.dart`) and donor availability (`post_donation_availability_screen.dart`).

---

## 4. Application Flow & Screen Layouts

```
[Splash Screen] 
       │
       ▼
[Sign In Screen] ──(Register)──► [Register Screen]
       │ (On Auth Success)
       ▼
┌─────────────────────────────────────────────────────────┐
│              HomeNavigationBar Shell                    │
├──────────────┬──────────────┬──────────────┬────────────┤
│  Dashboard   │   Requests   │    Chats     │  Profile   │
│   Screen     │    Screen    │    Screen    │   Screen   │
└──────┬───────┴──────┬───────┴──────┬───────┴────────────┘
       │              │              │
       ▼              ▼              ▼
  Bar Charts     Post Request   Message Thread
  & Metrics     & Post Donate    Conversation
```

---

## 5. Architectural Principles & Recommendations

1. **Separation of Concerns (SoC)**: UI components in `views/` interact with logic in `view_models/` without embedding inline backend or complex business rules.
2. **Centralized Design System**: All colors, typography, and button/card styles are consumed strictly from `core/theme` and `core/ui_components` to maintain visual consistency.
3. **Future Scalability Enhancements**:
   - **State Management**: As app complexity grows, introducing **Provider**, **Riverpod**, or **Bloc/Cubit** will make state reactive across non-hierarchical widgets.
   - **Repository Pattern**: Adding a `repository/` layer between `view_models/` and Firebase (Firestore / Realtime Database) will separate data fetching from view model state holding.
   - **Dependency Injection**: Introducing `get_it` or `injectable` for clean service locator patterns.

---

*Last Updated: February 2025 | Khoon App Repository*
