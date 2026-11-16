# Database Inventory — dotnet-hrms-stored-procedures

## Verdict

**No database artifacts are present in this repository.**

Verification commands conceptually applied at baseline `7b01d9f`:

- `find . -name '*.sql'` → empty
- No `db.sql`, no `App_Data/*.sql`, no migrations folder
- Upstream `main` likewise lacks SQL / Web.config (checked via `git ls-tree upstream/main`)

## README claims vs evidence

| Claim | Evidence |
|---|---|
| `db.sql` with full schema + SPs + seed | File missing |
| 25 tables | Not verifiable |
| Access exclusively via stored procedures | **C# side confirmed** (`CommandType.StoredProcedure` throughout `helper.cs`) |
| Naming `sp_{Verb}_{Entity}` | Two names referenced in code; definitions absent |

## Inventories that can be stated safely

### Connection

- Connection string name: `HRMSConnection` (`DB.cs`)
- Provider: `MySql.Data.MySqlClient`

### Procedures referenced (definitions inaccessible)

1. `sp_Get_EmployeeForLogin` — expected columns used by C#: `PasswordHash`, `EmployeeId`, `FullName`, `RoleName`; param `@p_username`
2. `sp_Insert_AuditLog` — params `@p_employee_id`, `@p_action_type`, `@p_entity_name`, `@p_entity_id`, `@p_details`, `@p_ip_address`

### Helper conventions implying other SP shapes (no names bound in Login module)

`helper.cs` supports generic executors (`ExecuteProcedure`, `ExecuteReader`, `ExecuteLoginProcedure`, etc.) including OUT params `@o_token`, `@o_expires_at`, `@o_errorout`. **Login.cs does not call `ExecuteLoginProcedure`** — it uses reader + C# JWT instead. No additional SP names appear in committed C#.

## Nested procedures / triggers / views

**Not verified.** No SQL source containing `CREATE PROCEDURE`, `CREATE TRIGGER`, or `CREATE VIEW` exists in the tree. This document does **not** assert their existence.
