# Component Inventory — dotnet-hrms-stored-procedures

Source files excluding `.git`, `bin/`, `packages/` content blobs:

| Path | Role |
|---|---|
| `api/Login.asmx` | ASMX markup; CodeBehind `~/App_Code/Login.cs` |
| `App_Code/Login.cs` | WebMethods: LoginUser, Logout, CheckSession |
| `App_Code/DB.cs` | `MySqlConnection` factory from `HRMSConnection` |
| `App_Code/helper.cs` | SP execution helpers (reader/procedure/login/logout/multi) |
| `App_Code/JwtHelper.cs` | JWT HS256, cookies, CSRF, login rate limit |
| `App_Code/AuthGuard.cs` | Per-request auth + optional role gate |
| `App_Code/PasswordHelper.cs` | bcrypt hash/verify (work factor 12) |
| `Global.ascx` / `Global.ascx.cs` | Intended CORS/preflight hooks (typed as UserControl) |
| `packages.config` | NuGet pins (net48); incomplete vs bin |
| `website.publishproj` | Web publish project; `TargetFrameworkVersion` v4.8; virtual path `/gramsarthi-backend` |
| `bin/` | Deployed dependency DLLs (MySql.Data, Newtonsoft.Json, BCrypt.Net-Next, …) |
| `packages/` | Partial NuGet package cache |
| `README.md` | Setup + architecture notes (references missing files) |

## ASMX endpoints inventory

| Endpoint | WebMethods |
|---|---|
| `/api/Login.asmx` | `LoginUser(username, password)`, `Logout()`, `CheckSession()` |

No other `.asmx` files exist.
