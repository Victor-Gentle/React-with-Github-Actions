FROM node:18

WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the app
COPY . .

# Expose port
EXPOSE 5000

# Start the backend server
CMD ["npm", "start"]


# Run Nginx
ENTRYPOINT ["nginx", "-g", "daemon off;"]