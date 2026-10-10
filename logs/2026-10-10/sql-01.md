# SQL: count per group with filter

`SELECT status, COUNT(*) FROM t GROUP BY status HAVING COUNT(*) > 5;`
