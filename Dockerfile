FROM klakegg/hugo:ext-alpine-onbuild AS hugo

FROM caddy:2-alpine
COPY --from=hugo /target/ /usr/share/caddy/
COPY ./Caddyfile /etc/caddy/Caddyfile
