Weechat
=======

autoconnect
-----------

    /set irc.server.freenode.autoconnect on 

autojoin
--------

    /set irc.server.freenode.autojoin "#channel1,#channel2"

script
-------

* beep.pl 1.1 (Beep (terminal bell) and/or run command on highlight/private message or new DCC)
* buffers.pl 4.8 (Sidebar with list of buffers)
* colorize_lines.pl 3.3 (colors text in chat area with according nick color, including highlights)
* iset.pl 3.5 (Interactive Set for configuration options)
* go.py 2.0 (Quick jump to buffers)
* grep.py 0.7.3 (Search in buffers and logs)

filter
------
With smart filter (keep join/part/quit from users who spoke recently):

    /set irc.look.smart_filter on
    /filter add irc_smart * irc_smart_filter *

NickServ
--------
If server supports SASL, you should use that instead of sending command for nickserv authentication, for example:

    /set irc.server_default.sasl_mechanism dh-blowfish
    /set irc.server.freenode.sasl_username "mynick"
    /set irc.server.freenode.sasl_password "xxxxxxx"

To run a command after connection to server, for example to authenticate with nickserv (only if you don’t use SASL for authentication):

    /set irc.server.freenode.command "/msg nickserv identify xxxxxxx"

If server does not support SASL, you can add a delay (between command and join of channels):

    /set irc.server.freenode.command_delay 5


