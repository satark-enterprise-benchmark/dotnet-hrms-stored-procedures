# Startup Guide — dotnet-hrms-stored-procedures

> **Phase 1 status: startup not performed** (and currently blocked).

## Blockers before any start attempt

1. Obtain MySQL schema + stored procedures (README’s `db.sql` not in repo)
2. Create `Web.config` with connection string + JWT settings
3. Use Windows + IIS + .NET Framework 4.8
4. Resolve `Global.asax` vs `Global.ascx` packaging so Application events run
5. Ensure BCrypt.Net-Next and Newtonsoft.Json restore cleanly (bin copies exist)

## Hypothetical start (once blockers cleared)

1. Import SQL into MySQL
2. Place `Web.config` at site root
3. Open site in Visual Studio or publish to IIS
4. Browse `/api/Login.asmx` and invoke WebMethods

Until blockers are cleared, treat the service as **non-startable from this acquisition alone**.
