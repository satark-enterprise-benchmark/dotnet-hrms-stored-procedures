# Architecture Overview — dotnet-hrms-stored-procedures

## Pattern

Monolithic ASP.NET **ASMX** site:

```text
Client (SPA expected on AllowedOrigins, e.g. localhost:5173)
   │  HTTPS / cookies (hrms_auth HttpOnly JWT + hrms_csrf)
   ▼
IIS + ASP.NET 4.8
   ├── api/Login.asmx  → App_Code/Login.cs WebMethods
   ├── App_Code/AuthGuard + JwtHelper + PasswordHelper
   └── App_Code/helper + DB  → MySql.Data → MySQL stored procedures
```

## Design rules stated in code/README

- Every DB call uses `CommandType.StoredProcedure` — no inline SQL in C# helpers.
- Password verify happens in C# (bcrypt), not SQL.
- Errors logged to `App_Data/error_log.txt` (folder not committed); client messages sanitized unless `IsDevEnvironment=true`.

## Structural defects relative to documented layout

| Documented | Actual |
|---|---|
| `Web.config` | Missing |
| `Global.asax` / `.asax.cs` | `Global.ascx` / `.ascx.cs` present instead |
| `db.sql` | Missing |
| `api/*.asmx` modules | Only `Login.asmx` |
