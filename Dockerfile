FROM mcr.microsoft.com/playwright:v1.49.0-noble

WORKDIR /app

# Install dependencies first
COPY package*.json ./
RUN npm install
RUN npm install -D @playwright/test

# Install browsers and dependencies
RUN apt-get update && apt-get install -y xvfb
RUN npx playwright install chromium firefox webkit
RUN npx playwright install-deps

# Copy application files last
COPY . .

# Expose port
EXPOSE 3000

# Set environment variables
ENV DISPLAY=:99
ENV PLAYWRIGHT_BROWSERS_PATH=/ms-playwright

# Start Xvfb and your application
CMD Xvfb :99 -screen 0 1024x768x16 & npm start
