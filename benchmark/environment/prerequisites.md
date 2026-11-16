# Prerequisites — dotnet-hrms-stored-procedures

## Required (from README + project files)

| Prerequisite | Why |
|---|---|
| Windows host | IIS + .NET Framework 4.8 |
| IIS with ASP.NET 4.8 | Hosting target |
| Visual Studio (or MSBuild web tooling) | Open/publish website |
| MySQL Server | Data store for SPs |
| NuGet restore capability | packages.config / bin refresh |
| **Missing `db.sql` content** | Cannot initialize DB from repo |
| **Missing `Web.config`** | Cannot configure connection/JWT/CORS |

## Not available

- Docker Desktop compose stack for this app
- Cross-platform .NET (this is Framework 4.8, not .NET Core)

## Benchmark scripts

`benchmark/scripts/*.sh` perform **read-only structural checks** on a checkout; they cannot satisfy Windows/IIS prerequisites from macOS CI agents.
