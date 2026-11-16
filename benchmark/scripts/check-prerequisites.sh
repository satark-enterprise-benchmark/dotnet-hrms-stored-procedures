#!/usr/bin/env bash
# Read-only host + tree checks for HRMS benchmark. Safe: no installs, no service starts.
set -euo pipefail

echo "=== dotnet-hrms-stored-procedures prerequisite check ==="
missing=0

# Host tools useful for static review (Windows runtime tools may be absent on macOS)
for cmd in git find grep; do
  if command -v "$cmd" >/dev/null 2>&1; then
    printf "OK   %s\n" "$cmd"
  else
    printf "MISS %s\n" "$cmd"
    missing=1
  fi
done

for cmd in docker dotnet msbuild; do
  if command -v "$cmd" >/dev/null 2>&1; then
    printf "INFO %s available at %s\n" "$cmd" "$(command -v "$cmd")"
  else
    printf "INFO %s not on PATH (may be expected on non-Windows)\n" "$cmd"
  fi
done

root="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$root"

if [[ -f api/Login.asmx ]]; then
  echo "OK   api/Login.asmx"
else
  echo "FAIL api/Login.asmx missing"
  missing=1
fi

if [[ -f db.sql ]]; then
  echo "OK   db.sql present"
else
  echo "FAIL db.sql ABSENT (blocking)"
  missing=1
fi

if [[ -f Web.config ]]; then
  echo "OK   Web.config present"
else
  echo "FAIL Web.config ABSENT (blocking)"
  missing=1
fi

if [[ -f Global.asax ]]; then
  echo "OK   Global.asax present"
else
  echo "WARN Global.asax ABSENT (Global.ascx found instead or missing)"
fi

sql_count="$(find . -name '*.sql' ! -path './.git/*' | wc -l | tr -d ' ')"
echo "INFO .sql file count: $sql_count"

exit "$missing"
