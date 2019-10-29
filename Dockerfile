FROM golang:1.13-alpine as builder

WORKDIR /app

COPY . .
RUN go build -o main .


FROM alpine:latest as final

COPY --from=builder /app /app

EXPOSE 8080
CMD ["/app/main"]
