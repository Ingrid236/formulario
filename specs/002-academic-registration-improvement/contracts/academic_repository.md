# Contract: Academic Repository (Domain Layer)

## Interface Description
Defines the operations available for managing academic data, abstracting the storage mechanism.

## Operations

### `Future<List<Academic>> getAllAcademics({int page, int limit})`
Retrieves registered students with pagination.
- **Parameters**: `page` (start index), `limit` (number of items).
- **Returns**: A list of `Academic` entities.
- **Errors**: `DataLoadException` on storage failure.

### `Future<bool> existsByCpf(String cpf)`
Checks if an academic with the given CPF already exists.
- **Returns**: `true` if exists, `false` otherwise.

### `Future<bool> existsByRegistration(String registrationNumber)`
Checks if an academic with the given registration number already exists.
- **Returns**: `true` if exists, `false` otherwise.

### `Future<void> registerAcademic(Academic academic)`
Saves a new student to the storage.
- **Input**: `academic` entity.
- **Returns**: `void`.
- **Errors**: `DuplicateRecordException` if CPF/Registration already exists; `StorageException` on failure.

### `Future<List<Course>> getAvailableCourses()`
Retrieves the list of courses for the selection dropdown.
- **Returns**: A list of `Course` entities.
- **Errors**: `DataLoadException` on storage failure.
