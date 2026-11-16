# Application Data Flow — dotnet-hrms-stored-procedures

## LoginUser (implemented in `Login.cs`)

```text
Client POST LoginUser(username, password)
  → JwtHelper.IsLoginAllowed(ip)          # in-memory rate limit
  → sp_Get_EmployeeForLogin(@p_username)  # MySQL SP — DEFINITION MISSING
  → PasswordHelper.Verify(password, hash) # bcrypt in process
  → JwtHelper.Generate + WriteAuthCookies # hrms_auth + hrms_csrf
  → sp_Insert_AuditLog(...)               # best-effort
  → JSON { employeeId, username, fullName, role }
```

## Logout

```text
AuthGuard.Require (optional audit)
  → sp_Insert_AuditLog (best-effort)
  → ClearAuthCookies
```

## CheckSession

```text
AuthGuard.Require (CSRF + JWT)
  → JSON session identity fields
```

## CORS / preflight

Intended in `Global.ascx.cs` `Application_BeginRequest` reflecting `AllowedOrigins`. Effectiveness depends on correct ASP.NET global wiring (`Global.asax` normally) and presence of `Web.config` — both problematic in this tree.
