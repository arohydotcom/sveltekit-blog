FROM node:20-alpine AS builder

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy source code
COPY . .

# Build the application
RUN npm run build

# Production stage
FROM node:20-alpine

WORKDIR /app

# Create non-root user
RUN addgroup -S app && adduser -S app -G app

# Copy package files and install production dependencies
COPY --from=builder /app/package*.json ./
RUN npm install --omit=dev

# Copy built application
COPY --from=builder /app/build ./build

# Set ownership
RUN chown -R app:app /app

USER app

EXPOSE 3000

ENV NODE_ENV=production

CMD ["node", "build"]
