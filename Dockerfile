# Stage 1: Build environment
FROM rust:1.75 AS builder

WORKDIR /app

# Copy project files
COPY Cargo.toml Cargo.lock ./

# Build the application with sccache caching
RUN cargo build --release

# Stage 2: Runtime environment
FROM debian:buster-slim AS runner

WORKDIR /app

# Copy the built binary from the previous stage
COPY --from=builder /app/target/release/elasticsearch-learning /app/elasticsearch-learning

# Run the application
CMD ["/app/elasticsearch-learning"]

