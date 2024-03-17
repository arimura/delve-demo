# Start from the official Go image
FROM golang:1.21.6

# Install Delve
RUN go install github.com/go-delve/delve/cmd/dlv@latest

# Copy the source files
WORKDIR /app
COPY . .

# Build the app
RUN go build -o /server

# Expose port 8080 for the application and 40000 for Delve
EXPOSE 8080 40000

# Start Delve debugger
ENTRYPOINT ["/go/bin/dlv", "exec", "/server", "--listen=:40000", "--headless=true", "--api-version=2", "--log"]
