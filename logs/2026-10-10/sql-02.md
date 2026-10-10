# SQL: LEFT JOIN to find missing rows

`SELECT a.* FROM a LEFT JOIN b ON b.a_id = a.id WHERE b.id IS NULL;`
