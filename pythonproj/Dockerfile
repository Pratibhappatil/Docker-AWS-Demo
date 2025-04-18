# Use the official Python image from Docker Hub as the base image
FROM python:3.7

# Set the working directory inside the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . .

# Install any dependencies from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Run the Python application
CMD ["python", "src/simple.py"]