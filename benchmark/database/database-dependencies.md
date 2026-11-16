# Database Dependencies — dotnet-hrms-stored-procedures

| Component | Database dependency | Status |
|---|---|---|
| `DB.GetConnection` | MySQL via `HRMSConnection` | Config file missing |
| `LoginUser` | `sp_Get_EmployeeForLogin`, `sp_Insert_AuditLog` | Procedure bodies missing |
| `Logout` | Optional `sp_Insert_AuditLog` | Same |
| `CheckSession` | None (JWT cookie only) | Works only after prior login + valid config |
| Entire remaining HRMS modules | Unknown SPs/tables | Modules not implemented in repo |

## Messaging dependencies

None.

## Blocking dependency for any DB-backed benchmark scenario

Obtain or reconstruct MySQL schema + stored procedure definitions + `Web.config`. Until then, only static code analysis of the ASMX/auth layer is possible.
