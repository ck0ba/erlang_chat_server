-module(chat_server).
-export([start/0, accept_connections/2, handle_client/2, broadcast_message/2]).

start() ->
    {ok, ListenSocket} = gen_tcp:listen(12345, [binary, {packet, line}, {reuseaddr, true}, {active, true}]),
    accept_connections(ListenSocket, []).

accept_connections(ListenSocket, Clients) ->
    {ok, Socket} = gen_tcp:accept(ListenSocket),
    Pid = spawn(fun() -> handle_client(Socket, Clients) end),
    accept_connections(ListenSocket, [Pid | Clients]).

handle_client(Socket, Clients) ->
    gen_tcp:send(Socket, "Welcome to the Erlang Chat Server!\n"),
    loop(Socket, Clients).

loop(Socket, Clients) ->
    receive
        {tcp, Socket, Data} ->
            broadcast_message(Data, Clients),
            loop(Socket, Clients);
        {tcp_closed, Socket} ->
            io:format("Client disconnected.~n")
    end.

broadcast_message(Message, Clients) ->
    lists:foreach(
        fun(Pid) ->
            gen_tcp:send(Pid, Message)
        end, Clients).
