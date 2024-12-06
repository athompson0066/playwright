FROM mcr.microsoft.com/playwright:v1.49.0-noble

WORKDIR /app

# Install dependencies first
COPY package*.json ./
RUN npm install
RUN npm install -D @playwright/test
RUN npm install -D @playwright/experimental-ct-core

# Install browsers and dependencies
RUN npx playwright install-deps
RUN npx playwright install

# Copy application files last
COPY . .
