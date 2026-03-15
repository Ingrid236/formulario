# Research: Cadastro de Acadêmicos

## Decisions

### Decision 1: State Management with Provider
- **Rationale**: Explicitly requested in the feature description. Provider is a mature, recommended solution for simple to medium complexity Flutter apps.
- **Alternatives considered**: Riverpod (more modern but not requested), Bloc (more complex, overkill for this simple form).

### Decision 2: Input Masking
- **Decision**: Use `mask_text_input_formatter` package.
- **Rationale**: Implementing robust masks for CPF and Phone manually with `TextInputFormatter` is error-prone and time-consuming. This package is the industry standard for Flutter masking.
- **Alternatives considered**: Manual implementation (rejected for complexity), `easy_mask` (less popular).

### Decision 3: Form Validation with RegEx
- **Decision**: Centralized utility in `lib/utils/validators.dart`.
- **Rationale**: Keeps the UI code clean and allows for easy unit testing of validation logic.
- **Alternatives considered**: Inline validation (rejected for poor maintainability).

### Decision 4: Detail View Implementation
- **Decision**: Use `showDialog` with a custom `AlertDialog` or `SimpleDialog`.
- **Rationale**: Provides a focused view of student details without leaving the current context, fitting the "simple and organized" UX requirement.
- **Alternatives considered**: `showModalBottomSheet` (also good, but Dialog is more standard for "details" in Material Design), New Page (rejected for flow disruption).

### Decision 5: Interaction Gestures
- **Decision**: Use `InkWell` for list item taps and `GestureDetector` for long press (or `InkWell`'s `onLongPress`).
- **Rationale**: `InkWell` provides visual feedback (ripple effect) which is essential for Material Design UI/UX.
- **Alternatives considered**: `GestureDetector` only (lacks visual feedback).

## Best Practices

- **Componentization**: Each form field and list item will be its own widget to ensure Single Responsibility Principle.
- **Memory Management**: All `TextEditingController`s will be properly disposed of in the `dispose()` method of the `StatefulWidget`.
- **UI/UX**: Consistent padding (16.0) and Material 3 design elements.
