# 🛍️ Flutter Clean Architecture Example (Bloc + Dio + Floor DB)

This project demonstrates a full **Flutter Clean Architecture** setup using:

- **Bloc / Cubit** → for State Management
- **Dio** → for API calls
- **Floor** → for local database (SQLite)
- **GetIt** → for Dependency Injection
- **Fakestore API** → Real-world data

---

## 📦 Features

- Fetch products from API using Dio
- Save data into Floor (SQLite) database
- Auto fallback to local database if API fails
- Clean folder structure following Clean Architecture principles
- Easy to maintain, test and scale

---

## 🛠️ Architecture Overview

```plaintext
🔵 UI Layer
    - ProductPage
    - BlocBuilder

🔵 Presentation Layer
    - ProductCubit (State Management)

🔵 Domain Layer
    - GetAllProducts (UseCase)
    - ProductRepository (Interface)

🔵 Data Layer
    - ProductRepositoryImpl
        - ProductRemoteDataSource (Dio)
        - AppDatabase & ProductDao (Floor)

🔵 External Dependencies
    - Dio Client
    - Floor Database
