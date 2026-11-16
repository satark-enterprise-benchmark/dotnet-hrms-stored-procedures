#!/usr/bin/env bash
# Read-only environment evidence capture.
set -euo pipefail

echo "=== environment-info ==="
echo "date_utc: $(date -u +%Y-%m-%dT%H:%M:%SZ)"
echo "cwd: $(pwd)"
echo "uname: $(uname -a)"

if [[ -d .git ]]; then
  echo "git_head: $(git rev-parse HEAD 2>/dev/null || echo unknown)"
  echo "git_branch: $(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo unknown)"
fi

echo "tracked_source_files:"
git ls-files 2>/dev/null | grep -E '\.(cs|asmx|config|publishproj|md)$' | head -n 50 || true

echo "sql_files:"
find . -name '*.sql' ! -path './.git/*' 2>/dev/null || true
