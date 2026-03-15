# Tasks: Academic Registration Interface Enhancement

**Feature**: Academic Registration Interface Enhancement
**Branch**: `002-academic-registration-improvement`
**Status**: Pending

## Implementation Strategy

We will follow a Clean Architecture approach, implementing layers from the inside out (Domain -> Data -> Presentation). The delivery will be incremental, starting with the core registration flow (MVP), followed by validation, and finally responsive design and polish.

## Phase 1: Setup
Initialization and project-wide configuration.

- [x] T001 Create feature directory structure in `lib/features/academic_registration/`
- [x] T002 Configure `provider` and `mask_text_input_formatter` in `pubspec.yaml`
- [x] T003 [P] Create shared theme constants (blue palette) in `lib/core/theme.dart`

## Phase 2: Foundational
Blocking prerequisites and core domain logic.

- [x] T004 Create `Course` entity in `lib/features/academic_registration/domain/entities/course.dart`
- [x] T005 Create `Academic` entity in `lib/features/academic_registration/domain/entities/academic.dart`
- [x] T006 Define `AcademicRepository` interface in `lib/features/academic_registration/domain/repositories/academic_repository.dart`
- [x] T007 [P] Define core failure and exception classes in `lib/core/errors/failures.dart`

## Phase 3: User Story 1 - Academic Registration (Priority: P1)
Goal: A functional form and list that can register and display academics.

- [x] T008 [US1] Implement `AcademicModel` with JSON serialization in `lib/features/academic_registration/data/models/academic_model.dart`
- [x] T009 [US1] Create `InMemoryAcademicDataSource` in `lib/features/academic_registration/data/datasources/academic_remote_data_source.dart`
- [x] T010 [US1] Implement `AcademicRepositoryImpl` in `lib/features/academic_registration/data/repositories/academic_repository_impl.dart`
- [x] T011 [US1] [P] Implement `GetAcademics` use case in `lib/features/academic_registration/domain/usecases/get_academics.dart`
- [x] T028 [US1] [P] Implement `GetCourses` use case in `lib/features/academic_registration/domain/usecases/get_courses.dart`
- [x] T012 [US1] Implement `RegisterAcademic` use case in `lib/features/academic_registration/domain/usecases/register_academic.dart`
- [x] T013 [US1] Implement `AcademicController` (ChangeNotifier) with course loading in `lib/features/academic_registration/presentation/controllers/academic_controller.dart`
- [x] T014 [US1] [P] Create reusable `AppFormField` widget in `lib/features/academic_registration/presentation/widgets/app_form_field.dart`
- [x] T015 [US1] Assemble `AcademicForm` in `lib/features/academic_registration/presentation/widgets/academic_form.dart`
- [x] T016 [US1] Implement `AcademicList` with `PaginatedDataTable` in `lib/features/academic_registration/presentation/widgets/academic_list.dart`
- [x] T017 [US1] Create `AcademicPage` entry point in `lib/features/academic_registration/presentation/pages/academic_page.dart`
- [x] T018 [US1] Register `AcademicController` and set `AcademicPage` in `lib/main.dart`

## Phase 4: User Story 2 - Input Validation (Priority: P2)
Goal: Ensure data integrity with clear user feedback.

- [x] T019 [US2] [P] Implement CPF and Email validation logic in `lib/core/utils/validators.dart`
- [x] T020 [US2] Apply `mask_text_input_formatter` to CPF, Phone, and Registration in `lib/features/academic_registration/presentation/widgets/academic_form.dart`
- [x] T021 [US2] Implement form-level validation logic and error snackbars in `lib/features/academic_registration/presentation/widgets/academic_form.dart`
- [x] T029 [US2] Implement duplicate academic validation (CPF/Registration) in `lib/features/academic_registration/domain/usecases/register_academic.dart`

## Phase 5: User Story 3 - Responsive Dashboard (Priority: P3)
Goal: Professional UI that adapts to any screen size.

- [x] T022 [US3] Use `LayoutBuilder` in `AcademicPage` to switch between Column and Row for Form/List layout
- [x] T023 [US3] Add `SingleChildScrollView` and `Scrollbar` to `AcademicList` for mobile responsiveness
- [x] T024 [US3] [P] Adjust field widths and padding dynamically in `lib/features/academic_registration/presentation/widgets/academic_form.dart`
- [x] T030 [US3] Implement paginated data fetching in `lib/features/academic_registration/data/repositories/academic_repository_impl.dart`

## Phase 6: Polish & Cross-Cutting Concerns
Final touches for a production-ready feel.

- [x] T025 Add icons to all form fields and styling to the `DataTable` headers
- [x] T026 Implement success/error dialogs for registration feedback
- [x] T031 Verify academic list performance against 500ms requirement
- [x] T027 Final audit of Clean Architecture layer dependencies and code cleanup

## Dependencies

1. **Foundational (Phase 2)** must be completed before any User Story implementation.
2. **Academic Registration (US1)** is the prerequisite for **Input Validation (US2)** and **Responsive Dashboard (US3)**.
3. **US2** and **US3** can be implemented in parallel if needed, as they affect different aspects of the Presentation layer.

## Parallel Execution Examples

- **Setup & Foundational**: T003, T007 can be done while core entities are being defined.
- **US1 Implementation**: T011 and T014 can be implemented simultaneously.
- **Validation**: T019 can be implemented in parallel with UI assembly.

## Independent Test Criteria

- **US1**: Entering valid student data adds a new row to the table below the form.
- **US2**: Submitting an invalid CPF or empty field displays a red error message.
- **US3**: Shrinking the browser window to mobile width stacks the form on top of the list.
