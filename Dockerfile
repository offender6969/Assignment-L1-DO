# Dockerfile for building a container image for an Aesthisia demo app based on Node.js 16 runtime

# Author: divye
# Date: 06/05/2023 (dd/mm/yy)

# Start with the official Node.js 16 image as the base image
FROM node:16

# Set the working directory for the application inside the container
WORKDIR /aesthisia-demo

# Copy the package.json file to the working directory
COPY package.json .

# Install dependencies using npm package manager
RUN npm install

# Copy the application files to the working directory in the container
COPY . .

# Expose port 3000 to allow external access to the application
EXPOSE 3000

# Start the application when the container is started
CMD ["npm","start"]
