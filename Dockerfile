# Step 1: Build the Go binary
FROM golang:1.21-alpine AS builder
WORKDIR /app
# Copy everything from your repo to the container
COPY . .
# Download dependencies and build
RUN go mod download && go build -o niltalk main.go

# Step 2: Create the final tiny image
FROM alpine:latest
WORKDIR /app
# Copy the built program from the builder stage
COPY --from=builder /app/niltalk .
# Copy the static files (templates/css) and your config
COPY --from=builder /app/static ./static
COPY config.toml ./config.toml

# Set the port and run it
EXPOSE 10000
ENTRYPOINT [ "./niltalk", "--config", "config.toml" ]
