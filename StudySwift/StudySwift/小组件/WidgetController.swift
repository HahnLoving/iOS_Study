//
//  WidgetController.swift
//  StudySwift
//
//  Created by z Hahn on 2022/6/25.
//

import UIKit
import WidgetKit

class WidgetController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.initWidget()
    }

  

    // MARK: 小组件
    func initWidget() {

        //1、创建URL对象；
        let url:URL! = URL(string:"http://api.3g.ifeng.com/clientShortNews?type=beauty");

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
        
        let btn = UIButton()
        btn.setTitleColor(.red, for: .normal)
        btn.setTitle("刷新", for: .normal)
        btn.frame = CGRect(x: 0, y: 100, width: 100, height: 100)
        btn.addTarget(self, action: #selector(clicktBtn1), for: .touchUpInside)
        self.view.addSubview(btn)
    }
    
    @objc func clicktBtn1() {
        let z = UserDefaults.init(suiteName: "group.zhahntest")
        // 保存数据
        z?.set("demo", forKey: "demo")
        let demo = z?.value(forKey: "demo")
        print("AppGroup交互 = \(String(describing: demo))")

        // 全部刷新
        WidgetCenter.shared.reloadAllTimelines()
         // 刷新指定的kind
        // WidgetCenter.shared.reloadTimelines(ofKind: <#T##String#>)
    }

}
