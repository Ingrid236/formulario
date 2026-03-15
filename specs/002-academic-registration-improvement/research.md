# Research: Academic Registration Interface Enhancement

## Technical Unknowns & Research Items

### 1. Clean Architecture Folder Structure in Flutter
- **Decision**: Adopt a feature-first approach (e.g., `features/academic_registration/`) containing subfolders for `data`, `domain`, and `presentation`.
- **Rationale**: This is the industry standard for scalable Flutter applications, ensuring that all code related to a specific feature is grouped together while maintaining strict layer separation.
- **Alternatives considered**: Layer-first approach (`data/`, `domain/`, `presentation/` at root). Rejected because it becomes difficult to navigate as the number of features grows.

### 2. Responsive & Scalable DataTables for Flutter Web
- **Decision**: Use `PaginatedDataTable` with `Scrollbar` for horizontal scrolling on small screens, and `LayoutBuilder` to adjust column visibility or cell padding.
- **Rationale**: `PaginatedDataTable` is more suitable for "Large Data Sets" as it naturally handles large amounts of data through pages, improving both performance and UX over a simple scrolling table.
- **Alternatives considered**: Standard `DataTable` (rejected due to poor performance with large data sets).

### 3. Modular Form Widget Composition
- **Decision**: Create a generic `AppFormField` wrapper that handles common styling (blue theme, icons, padding) and accepts specific validation/masking logic.
- **Rationale**: Ensures visual consistency across all 7+ fields and reduces boilerplate in the main `AcademicForm` widget.
- **Alternatives considered**: Manual definition of each `TextFormField`. Rejected due to high maintenance and inconsistent styling risk.

### 4. State Management with Provider
- **Decision**: Use a `ChangeNotifier` based Controller/ViewModel in the presentation layer to bridge the UI and the Domain layer.
- **Rationale**: `provider` is already in the project dependencies and is well-suited for simple to medium complexity state synchronization between the form and the list.
- **Alternatives considered**: BLoC or Riverpod. Rejected to stay consistent with existing project technology choices.

## Best Practices Identified
- Use `mask_text_input_formatter` for CPF and Phone fields to improve UX.
- Implement `FocusNode` management to allow smooth keyboard navigation between fields.
- Use `Theme.of(context).primaryColor` (set to blue) to ensure global style adherence.
- Validate inputs on every change or on "submit" depending on the field type for immediate feedback.
