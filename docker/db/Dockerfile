ARG PGSQL_VERSION
FROM postgres:${PGSQL_VERSION}-alpine

ENV LANG ja_JP.utf8

HEALTHCHECK \
    --interval=2s \
    --timeout=5s \
    --retries=5 \
    CMD pg_isready -U "${POSTGRES_USER:-postgres}" || exit 1
