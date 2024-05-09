#!/usr/bin/expect -f
set timeout -1
spawn code tunnel --accept-server-license-terms
expect "Github Account"
send -- "\033\[B"
send -- "\r"
expect eof
