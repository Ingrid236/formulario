# Contract: StudentProvider

The `StudentProvider` is responsible for managing the state of registered academics.

## Public Interface

### State
- `List<Student> students`: Unmodifiable list of registered students.

### Actions
- `void addStudent(Student student)`: Adds a new student and notifies listeners.
- `void removeStudent(Student student)`: Removes a student by reference or ID and notifies listeners.

### Expectations
- List should be sorted or follow a predictable order (e.g., newest first).
- Notification should occur immediately after state changes.
- Student objects should be immutable once created.
