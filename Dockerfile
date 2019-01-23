FROM golang:alpine as builder
WORKDIR /go/src/github.com/palnabarun/nammit
COPY *.go  .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

FROM alpine:latest
RUN apk --no-cache add ca-certificates
WORKDIR /app/
COPY --from=builder /go/src/github.com/palnabarun/nammit/app .
EXPOSE 5000
CMD ["./app"]
