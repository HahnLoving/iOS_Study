#!/usr/bin/expect -f
set uploadFileNameBefore /Users/zhahn/Documents/Hahn/iOS/体系/体系_Swift
set uploadFileName /ipaBuild/appstore.ipa
set host xxx.xxx.x.xx
set username xxx
set password xxx
spawn sftp xxx@xxx.xxx.x.xx
expect {
        "(yes/no)?" {send "yes
        "password:" {send "xxx
    }
expect "sftp>"
send "cd /xxx/xxx/xxx/
expect "sftp>"
send "put /Users/zhahn/Documents/Hahn/iOS/体系/体系_Swift/ipaBuild/appstore.ipa
expect "sftp>"
send "bye
expect eof