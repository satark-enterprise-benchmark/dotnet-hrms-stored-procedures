# Troubleshooting — dotnet-hrms-stored-procedures

| Issue | Cause | Mitigation |
|---|---|---|
| Cannot find `db.sql` | Not in repo/upstream | Obtain SQL from original authors or regenerate from live DB; do not invent procs for docs |
| `ConfigurationManager` failures | Missing `Web.config` | Supply config before runtime tests |
| MySQL procedure errors | SP definitions absent | Same as db.sql |
| CORS failures | Global not wired / AllowedOrigins missing | Fix asax packaging + config |
| Package restore misses JSON/BCrypt | packages.config incomplete | Use bin DLLs or add package refs |
| Looking for Docker | Not provided | Use Windows IIS path |
| Expecting triggers/views/nested procs | Not in source | Do not assume; verify only when SQL appears |

Run `./benchmark/scripts/validate-environment.sh` from repo root for structural confirmation of these gaps.
