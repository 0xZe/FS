# Use an official Python runtime as a parent image
FROM python:3.10.2-bullseye

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . .

# Install any needed packages specified in requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt

# Make port 5000 available to the world outside this container
EXPOSE 5000

## Define environment variable
#ENV MYSQL_HOST ze
#ENV MYSQL_USER myusr
#ENV MYSQL_PASSWORD deeb
#ENV MYSQL_DBNAME mydb

# Run app.py when the container launches
CMD ["python3", "-m", "flask", "run","--host=0.0.0.0"]