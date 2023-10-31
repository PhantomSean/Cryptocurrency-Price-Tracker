# Use an official Node.js runtime as a parent image
FROM node:latest

# Set the working directory in the container
WORKDIR /cryptocurrency_tracker_frontend/

# Copy the application code into the container
COPY public/ /cryptocurrency_tracker_frontend/public
COPY src/ /cryptocurrency_tracker_frontend/src
COPY package.json /cryptocurrency_tracker_frontend/

# Install dependencies
RUN npm install

# Build the React application
RUN npm run build

# Start the React application (use a production-ready server like Nginx)
CMD ["npm", "start"]
