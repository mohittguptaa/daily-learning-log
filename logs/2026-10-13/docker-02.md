# Docker: healthchecks

`HEALTHCHECK CMD curl -f http://localhost/ || exit 1` marks containers unhealthy.
