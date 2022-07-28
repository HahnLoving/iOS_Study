#!/bin/bash
cd `dirname $0`;
mkdir Payload;
echo =============================打包中=============================;
cp -rf /Users/zhahn/Library/Developer/Xcode/DerivedData/StudyOC-hfwqsjsdqzoybxbzbaaqwdpevare/Build/Products/Debug-iphoneos/StudyOC.app Payload;
zip -r -q appstore.ipa Payload;
rm -rf Payload;
echo =============================打包完成=============================;
open /Users/zhahn/Documents/Hahn/iOS/体系/StudyOC/IpaBuild/ipaUpload.command
exit;
