# Build stage
FROM golang:1.22.1-bullseye AS builder

# Create a non-root user
RUN useradd -u 10001 -m nonroot

# Set working directory
WORKDIR /app

# Copy go.mod and go.sum files
COPY go.mod go.sum ./

# Download dependencies
RUN --mount=type=cache,target=/go/pkg/mod \
    --mount=type=cache,target=/root/.cache/go-build \
    go mod download

# Copy the source code
COPY . .

# Build the application with security flags
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-w -s" -o /app/server .

# Final stage
FROM gcr.io/distroless/static-debian11

# Copy the non-root user
COPY --from=builder /etc/passwd /etc/passwd

# Copy the binary from builder
COPY --from=builder /app/server /server

# Use non-root user
USER nonroot

# Set environment variable for production
ENV GIN_MODE=release

# Command to run the application
ENTRYPOINT ["/server"]
