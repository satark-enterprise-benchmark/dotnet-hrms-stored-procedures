# API-to-Database Mapping — dotnet-hrms-stored-procedures

| ASMX WebMethod | HTTP surface | DB objects touched | Notes |
|---|---|---|---|
| `LoginUser` | `Login.asmx/LoginUser` | `sp_Get_EmployeeForLogin`, `sp_Insert_AuditLog` | SP SQL not in repo |
| `Logout` | `Login.asmx/Logout` | `sp_Insert_AuditLog` (optional) | Cookies cleared regardless |
| `CheckSession` | `Login.asmx/CheckSession` | none | JWT/CSRF only |

## Parameter mapping (from C#)

### sp_Get_EmployeeForLogin

- In: `@p_username`
- Expected result row fields read: `PasswordHash`, `EmployeeId`, `FullName`, `RoleName`
- Wrapper expects `{ success, data }` or error shape from `ExecuteSingleReader`

### sp_Insert_AuditLog

- In: `@p_employee_id`, `@p_action_type`, `@p_entity_name`, `@p_entity_id`, `@p_details`, `@p_ip_address`
- Via `ExecuteProcedure` expecting resultset columns such as success/error_code/message

No other API↔DB mappings exist in committed source.
