//
//  TestWidget.swift
//  StudySwiftUI
//
//  Created by z Hahn on 2022/6/25.
//

import SwiftUI
import WidgetKit

struct TestWidget: View {
    var body: some View {
       VStack
        {
            Text("AppGroup交互")
                .onTapGesture  {
                    // appgroup
                    let z = UserDefaults.init(suiteName: "group.zhahntest")
                    // 保存数据
                    z?.set("demo", forKey: "demo")
                    let demo = z?.value(forKey: "demo")
                    print("AppGroup交互 = \(String(describing: demo))")
                    
                    // 全部刷新
                    WidgetCenter.shared.reloadAllTimelines()
                    // 刷新指定的kind
//                    WidgetCenter.shared.reloadTimelines(ofKind: <#T##String#>)
                }
                .frame(width: 100, height: 100)
        }
        .navigationTitle("小组件")
        .onAppear {
            print("name = \(self)")
            //1、创建URL对象；
            let url:URL! = URL(string:"http://baidu.com");

            //2、创建Request对象；
            let urlRequest:URLRequest = URLRequest(url:url);

            //3、创建会话
            let session = URLSession.shared

            //4、通过创建任务
            let dataTask = session.dataTask(with: urlRequest) { (data:Data?, response:URLResponse?, error:Error?) in
                
              if(error != nil){
                   print(error?.localizedDescription);
              }else{
                    //let jsonStr = String(data: data!, encoding:String.Encoding.utf8);
                    //print(jsonStr)
                  do {
                        let dic = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
                        print(dic)
                    } catch let error{
                        print(error.localizedDescription);
                    }
                }
            } as URLSessionDataTask

            //5、启动任务
            dataTask.resume()
        }
    }
}

struct TestWidget_Previews: PreviewProvider {
    static var previews: some View {
        TestWidget()
    }
}
