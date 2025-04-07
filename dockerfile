#base image python
FROM python:3.10-slim

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

#working directory
WORKDIR /app

#install system dependencies
RUN apt-get update && apt-get install -y \ 
    build-essential \ 
    portaudio19-dev \ 
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

#requirements
COPY requirements.txt .

#pip update and install
RUN pip install --upgrade pip && pip install -r requirements.txt

#copy all files
COPY . .

#expose port
EXPOSE 8877

#cmd
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8877", "--no-browser", "--allow-root"]



