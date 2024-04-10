# Use the official Python image as base image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the Flask app code into the container
COPY app.py /app/
COPY templates /app/templates/

# Install dependencies
RUN pip install Flask

# Expose the port the app runs on
EXPOSE 5000

# Define the command to run the application
CMD ["python", "app.py"]
