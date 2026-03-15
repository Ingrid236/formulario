# Data Model: Cadastro de Acadêmicos

## Entity: Student

Represents a university academic record.

### Fields

| Field | Type | Description | Validation |
|-------|------|-------------|------------|
| `nome` | `String` | Full name of the student | Required, max 150 characters |
| `email` | `String` | Institutional email | Required, format `*@universidade.edu.br` |
| `telefone` | `String` | Brazilian phone number | Required, format `(99) 99999-9999` |
| `cpf` | `String` | Brazilian CPF number | Required, format `000.000.000-00`, basic numeric check |
| `matricula` | `String` | Enrollment number | Required, exactly 9 digits |
| `curso` | `String` | Enrolled course | Required |
| `periodo` | `String` | Current academic period | Required, between 1st and 10th |

### State Transitions

- **Unregistered**: Initial state of form fields.
- **Validating**: Form fields are checked against rules.
- **Registered**: Added to the `student_list` in `StudentProvider`.
- **Removed**: Deleted from `student_list`.
