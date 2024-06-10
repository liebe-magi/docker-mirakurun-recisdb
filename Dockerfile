FROM chinachu/mirakurun:3.9.0-rc.4 as builder

# Install dependencies
RUN apt update && \
    apt install -y \
    build-essential \
    libclang-dev \
    cmake \
    libdvbv5-dev \
    libpcsclite-dev \
    libudev-dev \
    pkg-config \
    curl \
    git

# Install Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Install recisdb-rs
RUN git clone --recursive https://github.com/kazuki0824/recisdb-rs.git && \
    cd recisdb-rs && \
    ~/.cargo/bin/cargo build -F dvb --release

FROM chinachu/mirakurun:3.9.0-rc.4 as runner

# Copy recisdb-rs
COPY --from=builder /app/recisdb-rs/target/release/recisdb /usr/local/bin/recisdb
