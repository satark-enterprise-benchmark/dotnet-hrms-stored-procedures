# Phase 1 Benchmark Documentation — dotnet-hrms-stored-procedures

Satark AI Enterprise PII Benchmark preparation package for the forked HRMS ASMX backend.

| Field | Value |
|---|---|
| Org fork | https://github.com/satark-enterprise-benchmark/dotnet-hrms-stored-procedures |
| Upstream | https://github.com/SiliconcareDev/hrms-backend |
| Baseline SHA | `7b01d9f2087f8dd2fa608cb1333ab162bdfbaa0b` (`main`) |
| Acquisition | `2026-11-16T21:10:24Z` |
| License | **None declared** (no root LICENSE; only NuGet package license texts under `packages/`) |

## Critical verification: `db.sql` and stored procedures

| Claim (README) | Verified result |
|---|---|
| `db.sql` — full MySQL schema + stored procedures + seed data | **ABSENT**. `find` over the tree (excluding `.git`) returns **zero** `*.sql` files. Also absent on `upstream/main`. |
| 25 tables (Employee, Attendance, Leave, Payroll, …) | **Not verifiable** — no schema DDL in source |
| Stored procedures `sp_*` | **Call sites only** in C#. **No `CREATE PROCEDURE` definitions** in repository |
| Nested procedures / triggers / views | **Not documented as present** — none found in source; do not assume |

### Stored procedure names referenced in C# (definitions missing)

| Procedure | Call site |
|---|---|
| `sp_Get_EmployeeForLogin` | `App_Code/Login.cs` via `ExecuteSingleReader` |
| `sp_Insert_AuditLog` | `App_Code/Login.cs` (login + logout audit) |

Comment text in `Login.cs` also mentions `sp_GetEmployee_ForLogin` (different spelling) — only the string `"sp_Get_EmployeeForLogin"` is actually invoked.

## What is present

- ASMX endpoint: `api/Login.asmx` → `App_Code/Login.cs` (`LoginUser`, `Logout`, `CheckSession`)
- DB helpers: `App_Code/DB.cs`, `App_Code/helper.cs` (generic SP executors)
- Auth: `JwtHelper.cs`, `AuthGuard.cs`, `PasswordHelper.cs` (bcrypt)
- Target: **.NET Framework 4.8**, **IIS**, **MySQL** via `MySql.Data` 8.0.26
- Prebuilt `bin/` DLLs and partial `packages/`

## What is missing for runnable auth

- `Web.config` (connection string, JWT secret, CORS allow-list, machineKey)
- `Global.asax` (repo has `Global.ascx` / `.ascx.cs` as `UserControl` — not a normal `HttpApplication` global)
- Entire MySQL schema + procedure definitions
- Docker / compose

## Startup status

**Not started.** Host requirements are Windows + IIS + .NET Framework 4.8 + MySQL with unknown schema.
