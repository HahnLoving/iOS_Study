#!/usr/bin/expect -f
set uploadFileNameBefore /Users/zhahn/Documents/Hahn/iOS/体系/体系_OC
set uploadFileName /ipaBuild/appstore.ipa
set host xxx.xxx.x.xx
set username xxx
set password xxx
spawn sftp xxx@xxx.xxx.x.xx
expect {
        "(yes/no)?" {send "yes"; exp_continue}
        "password:" {send "xxx"}
    }
expect "sftp>"
send "cd /xxx/xxx/xxx/"
expect "sftp>"
send "put /Users/zhahn/Documents/Hahn/iOS/体系/体系_OC/ipaBuild/appstore.ipa"
expect "sftp>"
send "bye"
expect eof
