#!/usr/bin/env bash
# Structural validation of HRMS checkout for Phase 1 benchmark readiness.
set -euo pipefail

root="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$root"
fail=0

echo "=== validate-environment (structural) ==="

require() {
  if [[ -f "$1" ]]; then
    echo "OK   $1"
  else
    echo "FAIL missing $1"
    fail=1
  fi
}

require api/Login.asmx
require App_Code/Login.cs
require App_Code/DB.cs
require App_Code/helper.cs
require App_Code/JwtHelper.cs
require App_Code/AuthGuard.cs
require App_Code/PasswordHelper.cs
require packages.config
require website.publishproj

# Expected absences — report clearly
for f in db.sql Web.config Global.asax Dockerfile docker-compose.yml LICENSE; do
  if [[ -f "$f" ]]; then
    echo "OK   $f unexpectedly present"
  else
    echo "INFO expected gap confirmed: $f absent"
  fi
done

echo "--- stored procedure string references ---"
grep -R -n -E 'sp_[A-Za-z0-9_]+' --include='*.cs' App_Code api 2>/dev/null || true

echo "--- CREATE PROCEDURE / TRIGGER / VIEW in tree ---"
if grep -R -n -E -i 'CREATE[[:space:]]+(PROCEDURE|TRIGGER|VIEW)' --include='*.sql' --include='*.cs' . 2>/dev/null | grep -v '/\.git/' ; then
  echo "INFO matched DDL-like statements above"
else
  echo "INFO no CREATE PROCEDURE/TRIGGER/VIEW matched in source"
fi

exit "$fail"
