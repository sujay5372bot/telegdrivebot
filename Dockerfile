# Use official Python image
FROM python:3.10-slim

# Install system dependencies (ffmpeg, wget, etc.)
RUN apt-get update && apt-get install -y \
    ffmpeg \
    wget \
    git \
    gcc \
    libpq-dev \
    && apt-get clean

# Set working directory
WORKDIR /app

# Copy all project files to the container
COPY . /app

# Install Python dependencies
RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

# Expose port (not needed for polling, but harmless)
EXPOSE 8080

# Default command to run your bot (change main file if needed)
CMD ["python", "bot.py"]
