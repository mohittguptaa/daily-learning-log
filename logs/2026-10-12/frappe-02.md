# Frappe: realtime events

`frappe.publish_realtime("my_event", data, user=user)` pushes to the browser; listen with `frappe.realtime.on("my_event", fn)`.
