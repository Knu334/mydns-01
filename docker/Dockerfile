ARG ARCH=
FROM ${ARCH}node:22.14.0-bookworm AS build
WORKDIR /app/
# Install required packages
COPY package.json ./
RUN npm install
# Copy source files
COPY src ./src
COPY tsconfig.json tsup.config.ts ./
# Compile TypeScript
RUN npx tsup

FROM ${ARCH}node:22.14.0-bookworm-slim
WORKDIR /app/
# Install Certbot
RUN apt-get update && \
    apt-get install -y python3 python3-venv libaugeas0 && \
    python3 -m venv /opt/certbot/ && \
    /opt/certbot/bin/pip install --upgrade pip && \
    /opt/certbot/bin/pip install certbot && \
    ln -s /opt/certbot/bin/certbot /usr/bin/certbot && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
# Switch to non-root user
#USER node
COPY --from=build /app/dist/app.js ./
COPY docker ./docker/
RUN chmod +x /app/docker/entrypoint.sh
RUN chmod +x /app/docker/authenticator.sh
RUN chmod +x /app/docker/cleanup.sh
# Run the script
CMD ["/bin/bash", "/app/docker/entrypoint.sh"]
