# Schema Overview — dotnet-hrms-stored-procedures

## Formal schema

**Unavailable.** Without `db.sql` or equivalent DDL, table list, PK/FK, indexes, and seed data cannot be reconstructed faithfully from this repository alone.

## Inferred entities from application code (non-authoritative)

These are **inferences from C# field usage**, not confirmed DDL:

| Inferred concept | Signals |
|---|---|
| Employee (or equivalent) | `EmployeeId`, `FullName`, `PasswordHash`, `RoleName`, username lookup |
| Audit log | `sp_Insert_AuditLog` parameter names |
| Roles | Role string in JWT + AuthGuard allowedRoles |

README additionally mentions Attendance, Leave, Payroll, Permission Matrix, etc. **Those modules and tables are not present as code or SQL in this baseline.**

## PII relevance (for benchmark planning)

If/when schema is obtained, expected PII-adjacent fields from login path include username, password hash, employee identifiers, full name, role, IP address in audit details.
