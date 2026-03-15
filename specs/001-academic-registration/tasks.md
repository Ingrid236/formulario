# Tasks: Cadastro de Acadêmicos

**Input**: Design documents from `/specs/001-academic-registration/`
**Prerequisites**: plan.md (required), spec.md (required for user stories), research.md, data-model.md, contracts/

**Organization**: Tasks are grouped by user story to enable independent implementation and testing of each story.

## Format: `[ID] [P?] [Story] Description`

- **[P]**: Can run in parallel (different files, no dependencies)
- **[Story]**: Which user story this task belongs to (e.g., US1, US2, US3)
- Include exact file paths in descriptions

---

## Phase 1: Setup (Shared Infrastructure)

**Purpose**: Project initialization and basic structure

- [X] T001 Add `provider` and `mask_text_input_formatter` dependencies to `pubspec.yaml`
- [X] T002 Create directory structure (models, providers, components, pages, utils) in `lib/`

---

## Phase 2: Foundational (Blocking Prerequisites)

**Purpose**: Core infrastructure that MUST be complete before ANY user story can be implemented

- [X] T003 [P] Implement `Student` model with all required fields in `lib/models/student_model.dart`
- [X] T004 [P] Implement RegEx validation logic (email, phone, CPF, enrollment) in `lib/utils/validators.dart`
- [X] T005 Initialize `StudentProvider` with an empty student list in `lib/providers/student_provider.dart`

---

## Phase 3: User Story 1 - Register New Academic (Priority: P1) 🎯 MVP

**Goal**: Allow users to fill out the registration form and save a new student to the state provider.

**Independent Test**: Fill all fields in the registration form with valid data and click "Cadastrar Acadêmico". Verify that the form clears and a success SnackBar is shown.

### Implementation for User Story 1

- [X] T006 [P] [US1] Create reusable `AppFormField` component with support for masks and validation in `lib/components/app_form_field.dart`
- [X] T007 [P] [US1] Create reusable `AppButton` component in `lib/components/app_button.dart`
- [X] T008 [US1] Implement registration form layout with `GlobalKey<FormState>` and `TextEditingController`s in `lib/pages/register_student_page.dart`
- [X] T009 [US1] Implement `addStudent(Student student)` method in `lib/providers/student_provider.dart`
- [X] T010 [US1] Connect form submission to `StudentProvider.addStudent` and show "Acadêmico cadastrado com sucesso" SnackBar in `lib/pages/register_student_page.dart`
- [X] T011 [US1] Implement `dispose()` to clean up `TextEditingController`s in `lib/pages/register_student_page.dart`

**Checkpoint**: User Story 1 is functional. Students can be registered (verification via debugger or temporary print statement since list UI is in US2).

---

## Phase 4: User Story 2 - View Academic List (Priority: P1)

**Goal**: Display the list of registered academics below the registration form.

**Independent Test**: Register multiple students and verify they appear in the list with Name, Course, Phone, and Email.

### Implementation for User Story 2

- [X] T012 [P] [US2] Create `StudentItem` component to display summary info (Name, Course, Phone, Email) in `lib/components/student_item.dart`
- [X] T013 [US2] Create `StudentList` component using `ListView.builder` and `context.watch<StudentProvider>()` in `lib/components/student_list.dart`
- [X] T014 [US2] Integrate `StudentList` below the registration form in `lib/pages/register_student_page.dart`

**Checkpoint**: User Stories 1 and 2 are functional together. Students appear in the list immediately after registration.

---

## Phase 5: User Story 3 - View Detailed Academic Information (Priority: P2)

**Goal**: Show full student details (including CPF, enrollment, and period) in a modal/dialog upon tapping a list item.

**Independent Test**: Tap on any student in the list and verify a dialog opens with all their information.

### Implementation for User Story 3

- [X] T015 [US3] Implement `onTap` interaction with `InkWell` in `lib/components/student_item.dart`
- [X] T016 [US3] Create `StudentDetailDialog` to show full student details (CPF, Enrollment, Period) in `lib/components/student_item.dart` (or as a separate component)
---

## Phase 6: User Story 4 - Remove Academic (Priority: P2)

**Goal**: Remove a student from the list by long-pressing their entry.

**Independent Test**: Long-press on a student in the list and verify they are removed and the UI updates.

### Implementation for User Story 4

- [X] T017 [US4] Implement `removeStudent(Student student)` method in `lib/providers/student_provider.dart`
- [X] T018 [US4] Implement `onLongPress` gesture to call `removeStudent` in `lib/components/student_item.dart`

---

## Phase 7: Polish & Cross-Cutting Concerns

**Purpose**: Improvements that affect multiple user stories

- [X] T019 Configure `ChangeNotifierProvider` in `lib/main.dart` and set `RegisterStudentPage` as the home screen
- [X] T020 [P] Apply consistent padding (16.0) and Material 3 theme adjustments across all components
- [X] T021 Final code cleanup and adherence to Single Responsibility Principle

---

## Dependencies & Execution Order

### Phase Dependencies

- **Setup (Phase 1)**: No dependencies - can start immediately.
- **Foundational (Phase 2)**: Depends on Setup completion - BLOCKS all user stories.
- **User Stories (Phase 3+)**: All depend on Foundational phase completion.
  - US1 and US2 are P1 and should be prioritized.
  - US3 and US4 are P2 and depend on US2 (list UI) for interaction.
- **Polish (Final Phase)**: Depends on all desired user stories being complete.

### User Story Dependencies

- **User Story 1 (P1)**: Foundation for data entry.
- **User Story 2 (P1)**: Depends on US1 for data, but UI can be built with mock data if needed.
- **User Story 3 (P2)**: Depends on US2 (list item interaction).
- **User Story 4 (P2)**: Depends on US2 (list item interaction).

---

## Parallel Example: User Story 1

```bash
# Launch components that don't depend on each other:
Task: "Create reusable AppFormField in lib/components/app_form_field.dart"
Task: "Create reusable AppButton in lib/components/app_button.dart"
```

---

## Implementation Strategy

### MVP First (User Story 1 & 2)

1. Complete Phase 1: Setup
2. Complete Phase 2: Foundational
3. Complete Phase 3: User Story 1 (Registration)
4. Complete Phase 4: User Story 2 (List View)
5. **STOP and VALIDATE**: Test basic registration and listing.

### Incremental Delivery

1. Foundation ready.
2. Add US1 → Can register.
3. Add US2 → Can see list.
4. Add US3 → Can see details.
5. Add US4 → Can remove.

---

## Notes

- [P] tasks = different files, no dependencies.
- Each user story is independently testable once its phase is complete.
- All `TextEditingController`s MUST be disposed of.
- SnackBar should be used for feedback.
