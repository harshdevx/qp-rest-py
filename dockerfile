# Use the official Python base image
FROM python:3.11-slim

# Set the working directory inside the container
WORKDIR /src

# Copy the requirements file to the working directory
COPY requirements.txt .
# COPY .env .
# COPY cms-private.pem .
# COPY cms-public.pem .
# COPY config.json .

# Install the Python dependencies
RUN pip install -r requirements.txt

# Copy the application code to the working directory
# COPY . .

# Expose the port on which the application will run
EXPOSE 8080

# Run the FastAPI application using uvicorn server
CMD ["uvicorn", "fastapi:main:app", "--host", "0.0.0.0", "--ssl-keyfile" "/root/key.pem", "--ssl-certfile" "/root/cert.pem", "--port", "8080"]