# Configuration — dotnet-hrms-stored-procedures

## Expected configuration keys (from code comments / README)

All expected in missing `Web.config`:

| Key | Purpose |
|---|---|
| connectionStrings/`HRMSConnection` | MySQL connection |
| `JwtSecret` | HS256 signing key (≥64 char random recommended) |
| `AllowedOrigins` | Comma-separated CORS origins |
| `IsDevEnvironment` | `true`/`false` error verbosity |
| `machineKey` | README: pin for App Pool recycle survival |
| Cookie Secure flag behavior | Dev vs prod guidance in README |

## Files present that are not configuration

- `packages.config` — NuGet
- `website.publishproj` — publish metadata (`SourceWebVirtualPath` = `/gramsarthi-backend`)

## Global CORS handler anomaly

`Global.ascx.cs` reads `AllowedOrigins` and sets CORS headers in `Application_BeginRequest`, but the class inherits `System.Web.UI.UserControl` and the file extension is `.ascx`, not `.asax`. Treat as **non-standard / likely broken wiring** until corrected outside this benchmark doc pass.
