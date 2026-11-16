# Known Limitations — dotnet-hrms-stored-procedures

1. **`db.sql` does not exist** in fork or upstream baseline — README is incorrect relative to tree.
2. **Stored procedure completeness: incomplete / unavailable** — references without definitions.
3. **No verified triggers, views, or nested procedures** — none in source; not claimed.
4. **No Web.config** — cannot run without reconstructing secrets/connection.
5. **Global.asax packaging issue** — `Global.ascx` UserControl likely will not run application events.
6. **packages.config incomplete** vs bin (BCrypt, Newtonsoft).
7. **No messaging**, no Docker, no non-Windows path.
8. **Domain coverage thin** — login only; claimed 25-table HR suite not present as code/SQL.
9. **Startup not verified**.
10. **License undeclared** at project level.
