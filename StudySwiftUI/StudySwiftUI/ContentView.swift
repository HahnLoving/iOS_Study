//
//  ContentView.swift
//  体系_SwiftUI
//
//  Created by z Hahn on 2022/6/13.
//

import SwiftUI

struct ContentView: View {
    
    var array: [CellType] = [.widget, .senior, .cgdTimer, .generic, .asyncAndAwait, .memory, .liveActivity]
    
    var body: some View {
        NavigationView
        {
            List {
                ForEach(0..<array.count, id:\.self) {
                    switch $0 {
                    case CellType.widget.rawValue:
                        /**
                         小组件
                         https://mp.weixin.qq.com/s/_DF_s_j49yroLf-gIID0Tw
                         */
                        NavigationLink(destination: TestWidget()) {
                            Text("小组件")
                        }
                    case CellType.senior.rawValue:
                        /**
                         Swift高阶函数
                         https://mp.weixin.qq.com/s?__biz=Mzg5Mjc1ODI5Nw==&mid=2247483780&idx=1&sn=f420a148bd10502aae87b37a17bd79fb&chksm=c03871f2f74ff8e4a0733b20f5b81fd9204ee3b6f5ac0f986ff346803bb064a7da611d473362&token=147400309&lang=zh_CN#rd
                         */
                        NavigationLink(destination: SwiftSeniorView()) {
                            Text("高阶函数")
                        }
                    case CellType.cgdTimer.rawValue:
                        /**
                         CGD定时器
                         https://mp.weixin.qq.com/s/7cPyKK5_JtVEjT9Jvyp0gw
                         */
                        NavigationLink(destination: TimerView()) {
                            Text("CGD定时器")
                        }
                    case CellType.generic.rawValue:
                        /**
                         Swift 泛型
                         https://mp.weixin.qq.com/s/yuzIVkUw_r2lOr2vONfgcA
                         */
                        NavigationLink(destination: GenericView()) {
                            Text("泛型")
                        }
                    case CellType.asyncAndAwait.rawValue:
                        /**
                         async/await 使用

                         https://mp.weixin.qq.com/s?__biz=Mzg5Mjc1ODI5Nw==&mid=2247483861&idx=1&sn=2ba5ec9add95afb5b1510309955300a2&chksm=c03871a3f74ff8b55445de0432eba07f35b59ff085456b6e0993356de2163cbf436bbc9bc804&token=501291339&lang=zh_CN#rd
                         */
                        NavigationLink(destination: AsyncAndAwaitView()) {
                            Text("async和await")
                        }
                    case CellType.memory.rawValue:
                        /**
                         内存管理机制
                         https://mp.weixin.qq.com/s/lRCUC_eTYb5N1MUwyXKWHg
                         */
                        NavigationLink(destination: MemoryView()) {
                            Text("内存管理")
                        }
                    case CellType.liveActivity.rawValue:
                        /**
                         灵动岛
                         */
                        NavigationLink(destination: LiveActivityView()) {
                            Text("灵动岛")
                        }
                    default:
                        Text("")
                    }
                }
            }
            
        }
    }
    
//    @State var isWillShow: Bool = false
//
//    func genericDemo() {
//        // MARK: 泛型例子
//        showGenericNumList(numList: [1,2,3])
//        showGenericStringList(strList: ["你","我","他"])
//
//        showGenericTList(tList: [1,2,3])
//        showGenericTList(tList: ["你","我","他"])
//
//        // MARK: 关联类使用范性
//        let sInt = StatesInt()
//        sInt.demo(item: 1)
//
//        let sT = StatesT<String>()
//        sT.demo(item: "good")
//
//        // MARK: Where 语句
//        let sT1 = StatesT<String>()
//        let sT2 = StatesT<Int>()
//        // 类型不相同错误 Global function 'ZStateTypeWhere(z1:z2:)' requires the types 'StatesInt.StateType' (aka 'Int') and 'String' be equivalent
////        ZStateTypeWhere(z1: sT1, z2: sT2)
//        ZStateTypeWhere(z1: sT1, z2: sT1)
//
//        // MARK: 泛型和Ang
//        showGeneric(n: 1)
//        showAny(n: 1)
//    }
//
//    var body: some View {
//        NavigationView
//        {
//            VStack(alignment: .center, spacing: 0) {
//                NavigationLink(destination: TimerView())
//                {
//                    Text("CGD定时器")
//                }
//                .frame(width: 100, height: 100)
//                NavigationLink(destination: TestWidget())
//                {
//                    Text("小组件")
//                }
//                .frame(width: 100, height: 100)
//            }
//            .onAppear{
////                print("name123")
//                print("name = \(self)")
////                swiftSeniorDemo()
//            }
//        }
//        .onAppear {
////            print("name = \(self)")
////                genericDemo()
//            //1、创建URL对象；
//                  let url:URL! = URL(string:"http://baidu.com");
//
//                  //2、创建Request对象；
//                 let urlRequest:URLRequest = URLRequest(url:url);
//
//                 //3、创建会话
//                 let session = URLSession.shared
//
//                 //4、通过创建任务
//                 let dataTask = session.dataTask(with: urlRequest) { (data:Data?, response:URLResponse?, error:Error?) in
//
//                      if(error != nil){
//                           print(error?.localizedDescription);
//                      }else{
//                            //let jsonStr = String(data: data!, encoding:String.Encoding.utf8);
//                            //print(jsonStr)
//                          do {
//                                let dic = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
//                                print(dic)
//                            } catch let error{
//                                print(error.localizedDescription);
//                            }
//                        }
//                    } as URLSessionDataTask
//
//                    //5、启动任务
//                    dataTask.resume()
//        }
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
