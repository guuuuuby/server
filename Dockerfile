from imbios/bun-node:latest-20-debian as frontend-build
workdir /usr/src/app
copy dashboard .
run bun install --frozen-lockfile
run bun run build

from oven/bun:latest as base
workdir /usr/src/app
copy backend .
copy --from=frontend-build /usr/src/app/dist static
run bun install --frozen-lockfile
expose 8001
expose 8000
entrypoint bun start
