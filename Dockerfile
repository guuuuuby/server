from imbios/bun-node:latest-20-debian as frontend-build
copy dashboard .
run bun install
run bun build

from over/bun:latest as base
copy backend .
copy frontend-build:dist static
run bun install
entrypoint bun start
