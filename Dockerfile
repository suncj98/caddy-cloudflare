FROM golang:1.20.3 as builder
RUN go install github.com/caddyserver/xcaddy/cmd/xcaddy@latest
RUN xcaddy build --output /caddy --with github.com/caddy-dns/cloudflare
RUN chmod +x /caddy

FROM caddy:latest
COPY --from=builder /caddy /usr/bin/caddy
