# Step 1: Use an official, lightweight Python runtime as a parent image
FROM python:3.10-slim

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy the requirements file into the container first
# (This is a Docker trick to speed up builds by caching dependencies)
COPY requirements.txt .

# Step 4: Install the Python packages listed in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Step 5: Copy the rest of your project's source code into the container
COPY . .

# Step 6: Define the command that runs when the container starts
# This will automatically trigger your training pipeline
CMD ["python", "src/train.py"]
