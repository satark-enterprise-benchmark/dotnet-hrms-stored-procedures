# Asynchronous Data Flow — dotnet-hrms-stored-procedures

## Finding

**No asynchronous messaging or background processing** is present in this repository.

- No message bus clients
- No Hangfire/Quartz/Windows Services
- No async queue writers in `App_Code`
- Audit logging is synchronous best-effort inside request threads

Rate limiting in `JwtHelper` is in-process memory (request-path), not a distributed async system.

## Implication for benchmark

Only synchronous request/response ASMX ↔ MySQL SP patterns apply — and MySQL SP definitions are currently inaccessible.
