#!/bin/bash
cd `dirname $0`;
mkdir Payload;
echo =============================打包中=============================;
cp -rf /Users/zhahn/Library/Developer/Xcode/DerivedData/体系_OC-fcnmmjqemdeeudawbpshbwixsvmk/Build/Products/Debug-iphoneos/体系_OC.app Payload;
zip -r -q appstore.ipa Payload;
rm -rf Payload;
echo =============================打包完成=============================;
exit;
