# Base image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy all files
COPY . /app

# Install dependencies
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# Expose port for webhook mode
EXPOSE 8080

# Start the bot (change to webhook command if needed)
CMD ["python", "bot.py"]
