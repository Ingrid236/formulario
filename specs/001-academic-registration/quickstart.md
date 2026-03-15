# Quickstart: Cadastro de Acadêmicos

This feature adds a student registration system to the app.

## Prerequisites

- Flutter SDK (latest stable)
- `provider` package
- `mask_text_input_formatter` package

## Development Workflow

1.  **Run with Hot Reload**: `flutter run`
2.  **Add a student**: Fill the form on the main page and click "Cadastrar Acadêmico".
3.  **View details**: Tap any item in the list.
4.  **Remove a student**: Long-press any item in the list.

## Project Structure (Feature-specific)

- `lib/models/student_model.dart`: Entity definition.
- `lib/providers/student_provider.dart`: State management logic.
- `lib/pages/register_student_page.dart`: The main UI screen.
- `lib/components/`: Reusable UI elements (form fields, buttons, list items).
- `lib/utils/validators.dart`: Validation logic.
