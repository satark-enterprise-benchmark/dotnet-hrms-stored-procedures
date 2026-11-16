# Installation — dotnet-hrms-stored-procedures

## Documented upstream steps (blocked)

README instructs:

1. Open in Visual Studio; restore NuGet packages
2. Add `HRMSConnection` to `Web.config` — **file missing**
3. Set `JwtSecret` — **file missing**
4. Run `db.sql` against MySQL — **file missing**
5. Replace placeholder admin bcrypt hash — **seed missing**
6. F5 / browse `Login.asmx`

## What can be installed from this tree alone

- Inspect source and `bin/` dependencies
- On a Windows machine, attempt to recreate `Web.config` and attach a MySQL database **only after obtaining schema/procs from another source**

## Docker

No Dockerfile or compose file exists. Adding a faithful Linux container for .NET Framework 4.8 ASMX is **not practical**; benchmark package does not add compose.
