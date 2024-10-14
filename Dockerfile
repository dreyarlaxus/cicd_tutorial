FROM ubuntu:latest
MAINTAINER Phu Thinh "thinhb2112010@student.ctu.edu.vn"

# Install necessary packages
RUN apt update -y && \
    apt install -y python3-pip python3-dev python3-venv build-essential curl

# Add application source code to Docker image
ADD . /flask_app
WORKDIR /flask_app

# Create a Python virtual environment
RUN python3 -m venv venv

# Upgrade pip and install necessary packages using the virtual environment's Python
RUN venv/bin/python -m pip install --upgrade pip && \
    venv/bin/python -m pip install --no-cache-dir -r requirements.txt

# Set the environment variable to use the virtual environment
ENV PATH="/flask_app/venv/bin:$PATH"

# Run the Flask application
ENTRYPOINT ["python"]
CMD ["flask_docker.py"]
