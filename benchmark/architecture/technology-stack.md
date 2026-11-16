# Technology Stack — dotnet-hrms-stored-procedures

| Layer | Technology | Evidence |
|---|---|---|
| Language | C# | `App_Code/*.cs` |
| Web framework | ASP.NET ASMX Web Services | `Login.asmx`, `[WebMethod]` |
| Runtime | .NET Framework 4.8 | `website.publishproj` TargetFrameworkVersion v4.8; packages `targetFramework="net48"` |
| Hosting | IIS (Windows) | README hosting target; publishproj |
| Database client | MySQL via MySql.Data 8.0.26 | `packages.config`, `bin/MySql.Data.dll`, `using MySql.Data.MySqlClient` |
| Database server | MySQL (assumed) | Connection string provider name; **server/schema not in repo** |
| JSON | Newtonsoft.Json (DLL in bin; not listed in packages.config) | `Login.cs`, `helper.cs` |
| Password hashing | BCrypt.Net-Next (DLL in bin; not listed in packages.config) | `PasswordHelper.cs` |
| Auth tokens | Custom JWT HS256 (no external JWT package) | `JwtHelper.cs` |
| PDF (unused in auth path) | Select.HtmlToPdf 25.2.0 | packages.config / bin |
| Containers | None | No Dockerfile / compose |

## Messaging

None. No Kafka, RabbitMQ, queues, or background workers in tree.
