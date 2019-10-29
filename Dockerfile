FROM golang:1.13-alpine as builder

WORKDIR /app

COPY . .
RUN go build -ldflags="-s -w" -o /app/main .


FROM alpine:3.8 as final

COPY --from=builder /app/main /app/main

EXPOSE 8080
CMD ["/app/main"]
