FROM golang:1.23 AS builder
WORKDIR /web
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o server . && ls -l /web

FROM alpine:3.20
WORKDIR /srv
COPY --from=builder  /web/server .
COPY --from=builder  /web/static ./static

EXPOSE 8080
CMD [ "./server" ]