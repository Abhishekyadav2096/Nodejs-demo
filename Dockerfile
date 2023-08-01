# Use the official Node.js LTS (Long Term Support) image with version 16.14.0 as the base image
FROM node:16.14.0

# Create and set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy all the application source code to the container's working directory
COPY . .

# Expose the port that your Node.js application listens on (change this if your app uses a different port)
EXPOSE 5000

# Command to start your Node.js application
CMD ["npm", "start"]
