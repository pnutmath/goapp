
FROM golang:1.13.4-alpine3.10 AS builder

RUN apk update 

WORKDIR /app

COPY ./ ./

RUN CGO_ENABLED=0 go build \
    -installsuffix 'static' \
    -o ./server main.go

FROM alpine:3.10 AS final

WORKDIR /app

COPY --from=builder /app .

ENTRYPOINT ["./server"]