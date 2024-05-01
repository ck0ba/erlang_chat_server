# Erlang Chat Server
This repository contains a simple Erlang chat server that allows multiple clients to connect and exchange messages in real-time.

## Getting Started
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites
You need to have Erlang installed on your machine to run the chat server. You can download it from [Erlang Official Website](http://www.erlang.org/downloads).

### Installing
To run the chat server, clone the repository and navigate to the src directory:

```bash
git clone https://github.com/ck0ba/erlang_chat_server.git
cd erlang_chat_server/src
```

### Running the Server
Open your terminal and run the following commands:

```bash
erl
c(chat_server).
chat_server:start().
```

### Running with Docker
To run the chat server using Docker, you can build and run the container with the following commands:

```bash
docker build -t erlang_chat_server .
docker run -p 1234:1234 erlang_chat_server
```
