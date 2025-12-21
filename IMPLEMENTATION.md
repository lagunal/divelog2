# Dive Log App - Implementation Plan

This document outlines the phased implementation plan for building the Dive Log Flutter application.

After completing a task, if any TODOs were added to the code or if anything was not fully implemented, new tasks will be added to this plan to ensure everything is completed later.

## Journal

### Phase 1: Project Initialization and Setup

*   **Learnings:** The `create_project --empty` command does not create a `test` directory or `widget_test.dart` by default, which means no test files needed explicit removal. The initial app launch timed out, requiring a cold boot of the emulator. Also, the emulator device ID changed after cold boot (from `emulator-5556` to `emulator-5554`), requiring manual connection to the DTD URI.
*   **Surprises:** The `create_project --empty` behavior regarding the `test` directory. Emulator device ID change.
*   **Deviations:** None from the overall plan.

### Phase 2: Firebase Integration & Authentication UI

*   **Learnings:** Integrating Firebase and mocking its dependencies in Flutter widget tests proved challenging due to its static initializers and platform channel dependencies. Injecting `FirebaseAuth` into `MainApp` improved testability.
*   **Surprises:** The difficulty in mocking `Firebase.initializeApp()` and `FirebaseAuth.instance` directly in widget tests using `mocktail` without resorting to a dedicated Firebase testing library or significant architectural changes.
*   **Deviations:** Deferred comprehensive widget tests for `MainApp` and `MainScreen` due to Firebase mocking complexities. Unit tests for `AuthenticationService` and widget tests for `LoginScreen`/`SignupScreen` were successfully implemented.

### Phase 3: Core App Structure and Navigation

*   **Learnings:** Setting up `go_router` with `ShellRoute` provides a robust way to handle persistent bottom navigation bars. Using `refreshListenable` with the Firebase auth stream ensures seamless redirection upon login/logout.
*   **Surprises:** None.
*   **Deviations:** None.

---

## Phase 1: Project Initialization and Setup

In this phase, we will create the foundational Flutter project, configure it, and commit the initial version.

*   [x] Create a new empty Flutter package named `dive_log` in the current directory.
*   [x] Remove the default boilerplate code and comments from `lib/main.dart`.
*   [x] Remove the boilerplate `test/widget_test.dart` file. (Confirmed not present)
*   [x] Update the `description` in `pubspec.yaml` to "A mobile app for divers to log their dive sessions." and set the `version` to `0.1.0`.
*   [x] Create a placeholder `README.md` with a short description of the package.
*   [x] Create `CHANGELOG.md` with an initial entry for version `0.1.0`.
*   [x] Add necessary dependencies for the project foundation (`go_router`, `provider`, `google_fonts`).
*   [x] Commit this initial empty version of the package to the `main` branch.
*   [x] After committing, prompt the user for their preferred device and launch the app using the `launch_app` tool.

---

## Phase 2: Firebase Integration & Authentication UI

This phase focuses on setting up Firebase and building the user authentication flow.

*   [x] Add Firebase dependencies (`firebase_core`, `firebase_auth`, `cloud_firestore`, `firebase_storage`).
*   [x] Follow platform-specific setup steps for integrating Firebase with Flutter (e.g., adding `google-services.json` for Android).
*   [x] Create the authentication UI screens: `LoginScreen` and `SignupScreen`. These will be simple forms with email/password fields and buttons.
*   [x] Implement the `AuthenticationService` to handle user sign-up, sign-in, and sign-out logic using `firebase_auth`.
*   [x] Create a root widget that listens to Firebase auth state changes and directs the user to either the `LoginScreen` or the `MainScreen`.

---

## Phase 3: Core App Structure and Navigation

This phase will build the main navigation shell of the application.

*   [x] Implement the main navigation using `go_router`. Define routes for `/login`, `/signup`, and `/`.
*   [x] Create a `MainScreen` widget that contains the `Scaffold` with the `BottomNavigationBar` and a `Drawer`.
*   [x] Create placeholder widgets for the four main tabs: `HomeScreen`, `DivesScreen`, `StatisticsScreen`, and `ProfileScreen`.
*   [x] Configure the `BottomNavigationBar` to switch between the four placeholder tab widgets.
*   [x] Implement the `FloatingActionButton` on the `HomeScreen` to navigate to the (not-yet-created) dive log form.

---

## Phase 4: Local Database (Drift) and Data Models

Here, we will set up the local database which is the core of our offline-first strategy.

*   [ ] Add Drift dependencies (`drift`, `sqlite3_flutter_libs`, `path_provider`, `path`). Also add build-time dependencies (`drift_dev`, `build_runner`).
*   [ ] Define the `DiveSessions` table in a new file, including all fields from the design document (client, operator, depth, time, etc., plus `firestoreId`, `syncStatus`, `updatedAt`).
*   [ ] Create the `AppDatabase` class that uses the `DiveSessions` table.
*   [ ] Implement a `DatabaseService` (or similar Data Access Object pattern) that provides simple methods for CRUD (Create, Read, Update, Delete) operations on the `DiveSessions` table.
*   [ ] Run the `build_runner` to generate the necessary Drift code.

---

## Phase 5: Dive Log Form (Create/Edit)

This phase involves building the UI for adding and editing dive sessions.

*   [ ] Create the `DiveFormScreen` widget.
*   [ ] Build the form using `SingleChildScrollView` and `Form`, grouping related fields into `Card` widgets for clarity.
*   [ ] Use `TextFormField`, `DropdownButtonFormField`, and date/time pickers for inputs, all with Spanish labels.
*   [ ] Create a `DiveFormViewModel` to manage the state of the form.
*   [ ] Implement the "Save" functionality. When the user saves, the `ViewModel` will interact with the `DatabaseService` to save the dive session to the local Drift database with a `syncStatus` of `pending`.

---

## Phase 6: Displaying Dives (List and Detail)

This phase focuses on showing the user their logged dives.

*   [ ] Create a `DivesViewModel` that fetches dive sessions from the `DatabaseService`.
*   [ ] Replace the `DivesScreen` placeholder with a `ListView.builder` that displays the list of dives.
*   [ ] Create a custom `DiveSessionCard` widget to display summary information for each dive in the list.
*   [ ] Implement navigation from a `DiveSessionCard` to a `DiveDetailScreen`.
*   [ ] Add an "Edit" button to the `DiveDetailScreen`'s `AppBar` that navigates to the `DiveFormScreen` with the selected dive's data pre-filled.

---

## Post-Phase Checklist

After **each** phase, the following steps must be completed:

*   [x] Create or modify unit/widget tests for the code added or changed in this phase. (Unit tests for `AuthenticationService` and widget tests for `LoginScreen`/`SignupScreen` completed. Widget tests for `MainApp` deferred due to Firebase mocking complexities.)
*   [x] Run `dart_fix --apply` to clean up the code.
*   [x] Run the `analyze_files` tool and fix any reported issues.
*   [x] Run all tests to ensure they pass and that there are no regressions.
*   [x] Run `dart format .` to ensure formatting is correct.
*   [x] Re-read `IMPLEMENTATION.md` to check for any changes or new tasks.
*   [x] Update the `Journal` section in `IMPLEMENTATION.md` with learnings, surprises, or deviations. Check off completed tasks in the current phase.
*   [x] Use `git diff` to verify the changes, create a suitable commit message, and present it to the user for approval.
*   [x] **Wait for user approval before committing the changes and moving to the next phase.**
*   [x] After committing, if the app is running, use `hot_reload` or `hot_restart`.

---

## Phase 7: Search and Filtering

Implement the search and filter functionality on the Dives screen.

*   [ ] Add a search `TextField` to the `DivesScreen` `AppBar`.
*   [ ] Update the `DivesViewModel` to include logic that filters the list of dives based on the search query by calling the appropriate method in the `DatabaseService`.
*   [ ] Add a filter icon button to the `AppBar`.
*   [ ] Create a modal bottom sheet for the filter UI, allowing users to filter by date range, dive site, and operator.
*   [ ] Implement the filtering logic in the `DivesViewModel` and `DatabaseService` to query the local Drift database.

---

## Phase 8: PDF Generation

In this phase, we'll implement the PDF export feature.

*   [ ] Add the `pdf`, `printing`, and `share_plus` dependencies.
*   [ ] Create a `PdfService` responsible for generating a PDF from a `DiveSession` object.
*   [ ] Design the layout of the PDF to be clean and professional, including all relevant dive information.
*   [ ] Add the "Export to PDF" button to the `DiveDetailScreen` `AppBar`.
*   [ ] When tapped, the button will use the `PdfService` to generate the file, save it locally, and then use the `printing` package to show a preview and sharing options.

---

## Phase 9: Statistics Screen

Build the UI for displaying user statistics.

*   [ ] Add the `fl_chart` dependency.
*   [ ] Create a `StatisticsViewModel` that calculates various stats by querying the local `DatabaseService` (e.g., total dives, average depth, etc.).
*   [ ] Replace the `StatisticsScreen` placeholder with a UI that displays these stats and charts.
*   [ ] Implement at least one chart, for example, a bar chart showing the number of dives per month.

---

## Phase 10: Synchronization Service

This is the final core feature, enabling cloud sync.

*   [ ] Add the `connectivity_plus` dependency.
*   [ ] Create the `SyncService`.
*   [ ] Implement the logic to monitor network connectivity.
*   [ ] Implement the **upload** logic to push pending local changes to Firestore when the app comes online.
*   [ ] Implement the **download** logic to pull remote changes from Firestore to the local database.
*   [_] Implement the PDF file sync logic within the `SyncService` to upload locally saved PDFs to Firebase Storage.
*   [ ] Ensure the `SyncService` is initialized when the app starts.

---

## Phase 11: Finalization and Polish

This final phase is for documentation and final touches.

*   [ ] Create a comprehensive `README.md` file that fully describes the project, its features, and how to run it.
*   [ ] Create a `GEMINI.md` file that describes the app's purpose, architecture, and file layout for future reference.
*   [ ] Perform a final review of the entire application for any UI polish, bug fixes, or performance improvements.
*   [ ] Ask the user to inspect the final app and code to confirm they are satisfied.