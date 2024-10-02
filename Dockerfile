from imbios/bun-node:latest-20-debian as frontend-build
copy dashboard .
run bun install
run bun build

from oven/bun:latest as base
copy backend .
copy --from=frontend-build dist static
run bun install
expose 8001
expose 8000
entrypoint bun start
