FROM node:24-slim

COPY ./package.json /tmp/package.json

RUN cd /tmp && npm install && \
    npx playwright install chromium && \
    npx playwright install-deps chromium