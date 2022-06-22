#!/bin/bash
cd `dirname $0`;
mkdir Payload;
echo =============================打包中=============================;
cp -rf /Users/zhahn/Library/Developer/Xcode/DerivedData/体系_SwiftUI-ekbxkbbbgbjsqbbokondadkhpciy/Build/Products/Debug-iphonesimulator/体系_SwiftUI.app Payload;
zip -r -q appstore.ipa Payload;
rm -rf Payload;
echo =============================打包完成=============================;
exit;
