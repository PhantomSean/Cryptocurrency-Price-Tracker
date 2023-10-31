# Use an official Node.js runtime as a parent image
FROM node:16

# Set the working directory in the container
WORKDIR /app

# Copy the application code into the container
COPY . .

# Install dependencies
RUN npm install

# Build the React application
RUN npm run build

# Expose the port the application will listen on
EXPOSE 80

# Start the React application (use a production-ready server like Nginx)
CMD ["serve", "-s", "build"]
