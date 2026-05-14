# Use the official pre-compiled image as the base
FROM kailashnadh/niltalk:latest

# Set the working directory
WORKDIR /app

# Copy your custom config from your GitHub repo into the container
# The official image expects the config at /static/config.toml
COPY config.toml /static/config.toml

# Use the port Render expects
EXPOSE 10000

# Run Niltalk pointing to that config
CMD ["/app/niltalk", "--config", "/static/config.toml"]
