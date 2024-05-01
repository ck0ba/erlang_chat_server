# Use an official Erlang runtime as a parent image
FROM erlang:23

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the current directory contents into the container at /usr/src/app
COPY src/ .

# Make port 12345 available to the world outside this container
EXPOSE 12345

# Compile and run the chat server when the container launches
CMD ["erl", "-noshell", "-s", "chat_server", "start"]
