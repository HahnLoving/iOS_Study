//
//  WidgetController.swift
//  StudySwift
//
//  Created by z Hahn on 2022/6/25.
//

import UIKit
import WidgetKit

class WidgetController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.initWidget()
    }
    

    // MARK: 小组件
    func initWidget() {

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
