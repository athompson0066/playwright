FROM mcr.microsoft.com/playwright:v1.49.0-noble

WORKDIR /app

COPY package.json /app/
COPY . .

RUN npm install
RUN npx playwright install --with-deps

