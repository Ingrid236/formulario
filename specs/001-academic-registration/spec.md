# Feature Specification: Cadastro de Acadêmicos

**Feature Branch**: `001-academic-registration`  
**Created**: 2026-03-15  
**Status**: Draft  
**Input**: User description: "Crie um aplicativo Flutter completo chamado **Cadastro de Acadêmicos** com foco em boas práticas de desenvolvimento, validação de formulários e princípios de Interação Humano-Computador. O aplicativo deve ser estruturado de forma organizada e modular, utilizando **Provider para gerenciamento de estado**, **componentização**, **Form + TextFormField**, **TextEditingController**, validação com **RegEx**, e interações com **InkWell ou GestureDetector**. Objetivo do aplicativo: Permitir cadastrar acadêmicos universitários e visualizar uma lista dos acadêmicos cadastrados. Funcionalidades obrigatórias: 1. Tela principal com formulário de cadastro contendo os seguintes campos: * Nome completo (obrigatório, máximo 150 caracteres) * Email institucional (deve terminar com @universidade.edu.br) * Telefone com máscara brasileira (formato: (99) 99999-9999) * CPF com máscara (000.000.000-00) e validação básica * Matrícula (apenas números, 9 dígitos) * Curso * Período (1º ao 10º) 2. Botão \"Cadastrar Acadêmico\" * Deve validar todos os campos antes de salvar * Exibir mensagens de erro abaixo dos campos * Se tudo estiver correto, salvar o acadêmico em uma lista gerenciada por Provider * Mostrar um SnackBar com a mensagem \"Acadêmico cadastrado com sucesso\" 3. Lista de acadêmicos cadastrados abaixo do formulário Cada item da lista deve mostrar: * Nome * Curso * Telefone * Email 4. Interações com gestos * Toque no item da lista abre um modal ou dialog com os detalhes completos do acadêmico * Pressionar segurando (long press) remove o acadêmico da lista 5. Uso obrigatório de: * Form com GlobalKey * TextEditingController com dispose() * RegEx para validação de email e telefone * Provider para gerenciamento de estado * Componentização da interface * Clean Code e Single Responsibility Principle Estrutura recomendada do projeto: lib/ models/ student_model.dart providers/ student_provider.dart components/ app_form_field.dart app_button.dart student_list.dart student_item.dart pages/ register_student_page.dart utils/ validators.dart O modelo Student deve conter: nome email telefone cpf matricula curso periodo O provider deve conter: addStudent() removeStudent() lista de estudantes Requisitos adicionais de UX e IHC: * Exibir mensagens claras de erro * Usar padding e espaçamento consistentes * Usar ListView para lista de acadêmicos * Utilizar Material Design * Interface simples e organizada Também gere o arquivo **main.dart** configurando corretamente o Provider. O código deve ser completo e pronto para rodar."

## User Scenarios & Testing *(mandatory)*

### User Story 1 - Register New Academic (Priority: P1)

As a university administrator, I want to register a new academic by filling out a form with their personal and institutional details, so that they can be added to the system's database.

**Why this priority**: This is the core functionality of the application. Without registration, the app serves no purpose.

**Independent Test**: Can be fully tested by filling out all form fields with valid data and clicking "Cadastrar Acadêmico". The value is delivered when the academic appears in the list and a success message is shown.

**Acceptance Scenarios**:

1. **Given** the registration form is empty, **When** all fields are filled with valid data and the submit button is pressed, **Then** a success SnackBar "Acadêmico cadastrado com sucesso" is displayed and the academic is added to the list.
2. **Given** the registration form, **When** any field is left empty or filled with invalid data (e.g., wrong email format), **Then** error messages are displayed below the respective fields and no registration occurs.

---

### User Story 2 - View Academic List (Priority: P1)

As a user, I want to see a list of all registered academics directly below the registration form, so that I can quickly reference their basic information.

**Why this priority**: Essential for immediate verification that registration was successful and for quick access to student data.

**Independent Test**: Can be tested by registering multiple academics and verifying they all appear in the list with their Name, Course, Phone, and Email.

**Acceptance Scenarios**:

1. **Given** academics have been registered, **When** I view the main screen, **Then** I see a list where each item displays the academic's Name, Course, Phone, and Email.

---

### User Story 3 - View Detailed Academic Information (Priority: P2)

As a user, I want to tap on an academic in the list to see their full profile (including CPF, enrollment, and period), so that I can access more specific details not shown in the summary list.

**Why this priority**: Necessary for full data retrieval without cluttering the main list view.

**Independent Test**: Tap on any academic in the list. A modal or dialog should open showing all fields (Name, Email, Phone, CPF, Enrollment, Course, Period).

**Acceptance Scenarios**:

1. **Given** an academic list item, **When** I tap on it, **Then** a modal or dialog opens displaying all the academic's details.

---

### User Story 4 - Remove Academic (Priority: P2)

As a user, I want to remove an academic from the list by performing a long press on their entry, so that I can keep the list updated and remove incorrect or outdated records.

**Why this priority**: Important for data management and error correction.

**Independent Test**: Perform a long press on a specific academic in the list. The academic should be removed from the list.

**Acceptance Scenarios**:

1. **Given** an academic in the list, **When** I long-press on their item, **Then** the academic is removed from the list and the UI updates immediately.

---

### Edge Cases

- **Maximum Name Length**: User enters a name exactly at 150 characters or tries to exceed it.
- **Email Suffix**: User enters an email that is valid but does not end with `@universidade.edu.br`.
- **Invalid Enrollment**: User enters 8 or 10 digits instead of exactly 9.
- **Masking behavior**: User enters numbers only; masks for Phone and CPF should be applied automatically or validated correctly.
- **Empty List**: How the system behaves when no academics have been registered yet (should show an empty state or just the empty list area).

## Requirements *(mandatory)*

### Functional Requirements

- **FR-001**: System MUST allow registering academics with Name, Email, Phone, CPF, Enrollment, Course, and Period.
- **FR-002**: System MUST validate that the Name is required and has a maximum of 150 characters.
- **FR-003**: System MUST validate that the Email ends with `@universidade.edu.br`.
- **FR-004**: System MUST validate that the Phone follows the format `(99) 99999-9999`.
- **FR-005**: System MUST validate that the CPF follows the format `000.000.000-00`.
- **FR-013**: System MUST perform basic CPF validation (numeric check).
- **FR-006**: System MUST validate that the Enrollment consists of exactly 9 numeric digits.
- **FR-007**: System MUST validate that the Period is between 1st and 10th.
- **FR-008**: System MUST display clear error messages below fields that fail validation.
- **FR-009**: System MUST show a success notification ("Acadêmico cadastrado com sucesso") after a successful registration.
- **FR-010**: System MUST list registered academics below the form, showing Name, Course, Phone, and Email for each.
- **FR-011**: System MUST display full details of an academic in a modal/dialog when their list item is tapped.
- **FR-012**: System MUST remove an academic from the list when their item is long-pressed.
- **FR-014**: System MUST clear the form fields after a successful registration.

### Key Entities *(include if feature involves data)*

- **Academic (Student)**: Represents a university student.
  - Attributes: Name, Email, Phone, CPF, Enrollment (Matrícula), Course, Period.
  - Relationship: Stored in a collection managed by the system's state provider.

## Success Criteria *(mandatory)*

### Measurable Outcomes

- **SC-001**: Users can register a new academic in under 60 seconds (from start of form to confirmation).
- **SC-002**: 100% of registered academics in the list must satisfy all validation constraints (Regex, length, etc.).
- **SC-003**: Users can view the full details of any academic with a single tap interaction.
- **SC-004**: System successfully removes an academic entry within 1 second of the long-press gesture.
- **SC-005**: Form validation errors are visible within 200ms of an invalid submission attempt.
