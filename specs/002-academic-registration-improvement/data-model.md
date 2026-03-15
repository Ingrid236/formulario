# Data Model: Academic Registration

## Entities

### 1. Academic
Represents a student registered in the system.

| Field | Type | Validation / Constraints |
|-------|------|-------------------------|
| `id` | `String` | Unique identifier (UUID or similar) |
| `fullName` | `String` | Non-empty, alphanumeric |
| `institutionalEmail` | `String` | Valid email format, ends with `@institution.com` (assumption) |
| `phone` | `String` | Masked: `(00) 00000-0000` |
| `cpf` | `String` | Masked: `000.000.000-00`, valid CPF algorithm |
| `registrationNumber` | `String` | Non-empty, numeric |
| `period` | `int` | Range: 1 to 12 |
| `course` | `Course` | Reference to a Course entity |

### 2. Course
Represents an academic program.

| Field | Type | Description |
|-------|------|-------------|
| `id` | `String` | Unique identifier |
| `name` | `String` | Name of the course (e.g., "Computer Science") |

## Relationships
- **Academic** has a many-to-one relationship with **Course**.

## State Transitions
- **Registration**: Form Input → Validation → Domain Entity → Repository Save → List Update.
