FROM node:24-slim

RUN apt-get update && apt-get install -y \
    wget \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

COPY ./package.json /tmp/package.json

RUN cd /tmp && npm install && \
    npx playwright install chromium && \
    npx playwright install-deps chromium

ENV NODE_PATH=/tmp/node_modules