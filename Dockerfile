# Stage 1: Build the React application
FROM node:20-alpine

# Create and change to the app directory.
WORKDIR /usr/src/app

# Copy application dependency manifests to the container image.
# A wildcard is used to ensure both package.json AND package-lock.json are copied.
COPY package*.json ./

# Install dependencies.
RUN npm install

# Copy local code to the container image.
COPY . .

# Build the application.
RUN npm run build

# Stage 2: Serve the React application using Nginx
FROM nginx:alpine
WORKDIR /usr/share/nginx/html
RUN rm -rf *
COPY --from=build /app/build .

# Expose the port the app runs on
EXPOSE 80

# Run Nginx
ENTRYPOINT ["nginx", "-g", "daemon off;"]