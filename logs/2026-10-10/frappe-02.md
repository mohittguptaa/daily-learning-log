# Frappe: get a single field fast

`frappe.db.get_value("Customer", name, "customer_group")` avoids loading the whole doc.
