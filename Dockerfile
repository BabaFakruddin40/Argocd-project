# Use an official Python runtime
FROM python:3.11-slim

# Set a working directory
WORKDIR /app

# Install system dependencies (optional)
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy dependency list
COPY  app/ ./

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application source
#COPY . .

# Expose Flask port
EXPOSE 5000

# Run using Gunicorn (production)
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "main:app"] 