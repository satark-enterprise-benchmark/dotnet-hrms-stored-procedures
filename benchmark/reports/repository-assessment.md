# Repository Assessment — dotnet-hrms-stored-procedures

## Summary

Early-stage **ASMX auth backend** for an HRMS. Valuable as a **.NET Framework + MySQL SP** PII pattern sample, but **not executable as acquired** because schema/config are missing.

## Strengths

- Clear auth flow in `Login.cs`
- Consistent SP-only data access helpers
- JWT + CSRF + bcrypt patterns suitable for security/PII analysis
- Explicit .NET 4.8 / IIS / MySQL targeting

## Critical gaps

- **`db.sql` missing** (documented but not shipped; upstream also lacks it)
- **SP definitions missing** — only two names referenced
- **`Web.config` missing**
- **`Global.asax` missing** / suspicious `Global.ascx`
- No license file
- No Docker
- Only one ASMX module; HR domain incomplete per README checkboxes

## License

No repository-root license. NuGet packages under `packages/*/LICENSE.TXT` are dependency licenses only.
