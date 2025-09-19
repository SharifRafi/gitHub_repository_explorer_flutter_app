# 🚀 GitHub Repository Explorer

A beautiful and responsive Flutter app designed to search and explore GitHub's public repositories. This app features real-time search, offline caching, and elegant dark/light theme support.

## ✨ Features

- 🔍 **Real-time Repository Search** - Search GitHub's live repositories instantly
- 📱 **Responsive Design** - Optimized for both Android and iOS platforms
- 🌙 **Dark/Light Theme** - Switch themes according to your preference
- 💾 **Offline Support** - View cached data even without internet connection
- ⚡ **Infinite Scrolling** - Load more repositories with smooth scrolling
- 🎨 **Modern UI** - Beautiful animations with Material 3 design
- 🔗 **External Links** - Direct GitHub links in repository details

## 🚀 Setup Instructions

### Prerequisites
- Flutter SDK (3.8.1 or higher)
- Android Studio / VS Code
- Git

### Installation
1. **Clone the repository:**
```bash
git clone [repository-url]
cd github_repo_explorer_flutter
```
2. **Install dependencies:**
```bash
flutter pub get
```
3. **Generate JSON serialization:**
```bash
flutter packages pub run build_runner build
```
4. **Run the app:**
```bash
flutter run
```

### Supported Platforms
- ✅ **Android** (API 21+)
- ✅ **iOS** (iOS 12.0+)

## 🏗️ Architecture Overview
This project follows **Clean Architecture** pattern with SOLID principles:

```
lib/
├── core/                 # Core utilities and shared components
│   ├── error/           # Custom error handling
│   ├── network/         # Network connectivity checking
│   └── utils/           # Common utilities (Result pattern)
├── data/                # Data layer (Models, Data sources, Repository implementations)
│   ├── datasources/     # Remote and Local data sources
│   ├── models/          # JSON serializable models
│   └── repositories/    # Repository pattern implementations
├── domain/              # Business logic layer
│   ├── entities/        # Core business entities
│   ├── repositories/    # Repository contracts/interfaces
│   └── usecases/        # Business logic use cases
├── presentation/        # UI layer
│   ├── bloc/           # State management (Cubit/BLoC)
│   ├── pages/          # Screen widgets
│   └── widgets/        # Reusable UI components
└── di/                 # Dependency Injection setup
```

### Key Technologies & Patterns

**Architecture Patterns:**
- **Clean Architecture** - Clear separation of Domain, Data, and Presentation layers
- **Repository Pattern** - Data access abstraction
- **Dependency Injection** - Loose coupling with GetIt
- **Result Pattern** - Error handling with sealed classes

**State Management:**
- **BLoC/Cubit** - Predictable state management
- **RxDart** - Reactive programming for search debouncing

**Network & Caching:**
- **Dio** - HTTP client with interceptors
- **SharedPreferences** - Local data persistence
- **Connectivity Plus** - Network status monitoring

**UI/UX:**
- **Material 3** - Modern Google design system
- **Shimmer** - Loading state animations
- **Cached Network Image** - Efficient image loading and caching

### Key Components

**State Management:**
- `RepoListCubit` - Repository list and search state management
- `ThemeCubit` - App theme (dark/light) state management

**Data Flow:**
1. User search query → Debounced through RxDart
2. Use case executes → Repository pattern
3. Network check → Remote API call or data from cache
4. Response mapping → Model to Entity conversion
5. UI update → BLoC state emission

**Error Handling:**
- Custom `Result<T>` sealed class (Success/Error states)
- Network connectivity aware error handling
- Graceful fallback to cached data

## ⚠️ Assumptions/Limitations

### Assumptions
- Users have a stable internet connection for initial data loading
- GitHub API rate limits are respected (no authentication implemented)
- Search queries are in English or standard repository naming conventions
- Device has sufficient storage for offline caching

### Current Limitations
- **No Authentication** - Uses GitHub's public API without authentication (limited to 60 requests/hour)
- **Search Scope** - Only searches public repositories, no private repo access
- **Limited Filters** - Basic search functionality, no advanced filtering options
- **Cache Size** - Local cache storage is not size-limited, may grow over time
- **Network Dependency** - Initial app load requires internet connection
- **Rate Limiting** - Subject to GitHub API rate limits for unauthenticated requests


## 📱 Screenshots or Demo

<div align="center">
  
| Home Screen (Dark Theme) | Home Screen (Light Theme) |
|:------------------------:|:-------------------------:|
| ![Dark Theme Home](https://github.com/SharifRafi/gitHub_repository_explorer_flutter_app/blob/main/dark-home-screen.png?raw=true) | ![Light Theme Home](https://github.com/SharifRafi/gitHub_repository_explorer_flutter_app/blob/main/light-home-screen.png?raw=true) |

| Details Screen (Dark Theme) | Details Screen (Light Theme) |
|:---------------------------:|:----------------------------:|
| ![Dark Theme Details](https://github.com/SharifRafi/gitHub_repository_explorer_flutter_app/blob/main/dark-details-screen.png?raw=true) | ![Light Theme Details](https://github.com/SharifRafi/gitHub_repository_explorer_flutter_app/blob/main/light-details-screen.png?raw=true) |

</div>

> **Note:** Screenshots showcase the clean Material 3 design with seamless dark/light theme switching, repository cards with star counts, and detailed repository information pages.

---

**Built with ❤️ using Flutter & Clean Architecture**
