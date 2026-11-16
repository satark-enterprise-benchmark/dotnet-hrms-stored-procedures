# Dependency Map — dotnet-hrms-stored-procedures

```text
Login.asmx
  └─ Login.cs
       ├─ helper.ExecuteSingleReader("sp_Get_EmployeeForLogin")
       │    └─ DB.GetConnection() → MySQL  [procedure definition MISSING]
       ├─ PasswordHelper.Verify → BCrypt.Net-Next
       ├─ JwtHelper.Generate / WriteAuthCookies  [needs Web.config JwtSecret]
       ├─ helper.ExecuteProcedure("sp_Insert_AuditLog")  [definition MISSING]
       └─ AuthGuard.Require → JwtHelper + CSRF  [needs cookies + config]
```

## NuGet / bin dependencies (packages.config)

Declared: BouncyCastle 1.8.5, Google.Protobuf, K4os.*, MySql.Data 8.0.26, Select.HtmlToPdf 25.2.0, System.* buffers/memory/vectors/unsafe/tasks.

Present in `bin/` but **not** in `packages.config`: `BCrypt.Net-Next.dll`, `Newtonsoft.Json.dll`.

## External runtime dependencies (not vendored as server)

- Windows + IIS + ASP.NET 4.8
- MySQL server with unknown schema/procs
- Configuration file `Web.config` (missing)
