FROM ubuntu
RUN apt update && apt install -y openssl

# Use the official Node.js image as the base image
FROM node:18

# Set the working directory inside the container
WORKDIR /app

# Copy the package.json and package-lock.json files to the container
COPY package*.json ./

# Install the dependencies
RUN npm install

# Copy the source code to the container
COPY . .

# Set the environment variable for the port
ENV PORT=8080

# Expose the port
EXPOSE 8080

# Start the server
CMD ["node", "app.js"]
