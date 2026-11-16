# Application Overview — dotnet-hrms-stored-procedures

## Purpose

Attendance / HRMS **backend** intended as C# **ASMX Web Services** on **.NET Framework 4.8** with **MySQL stored-procedure** data access, JWT HttpOnly cookie auth, and CSRF double-submit.

## Actual completeness (from source + README status checkboxes)

| Module | Status |
|---|---|
| Auth (Login, Logout, CheckSession) | Code present for ASMX methods |
| Database schema (claimed 25 tables) | **Not in repo** |
| Employee / Shift / Attendance / Leave / Overtime / Payroll / Dashboards | README marks unchecked; **no ASMX modules beyond Login** |

## Delivered surface for benchmarking

A thin **login/session** service skeleton that *would* touch employee PII (username, password hash, employee id, full name, role) **if** MySQL procedures and config existed. As acquired, it is **not runnable** without reconstructing missing artifacts.
