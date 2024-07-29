FROM node:20-alpine AS build
COPY . .

ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN corepack enable
RUN --mount=type=cache,id=pnpm,target=/pnpm/store pnpm install --frozen-lockfile
RUN pnpm run build

FROM ghcr.io/muchobien/pocketbase:latest as runtime

RUN apk add --no-cache bash
COPY ./scripts /scripts
COPY --from=build /out /pb_public

ENV PB_HOOK_DIRECTORY="/pb_hooks"

COPY $PB_HOOK_DIRECTORY /pb_hooks

ENTRYPOINT ["/bin/bash", "-f","/scripts/start.sh"] 
CMD ["/scripts/start.sh" ]