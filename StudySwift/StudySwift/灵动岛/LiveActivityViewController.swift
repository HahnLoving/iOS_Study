//
//  LiveActivityViewController.swift
//  StudySwift
//
//  Created by z Hahn on 2022/11/25.
//

import UIKit

class LiveActivityViewController: BaseController {

    var state: LiveActivityState = .hamburger
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let btn1 = UIButton(frame: CGRect(x: 10, y: 100, width: 200, height: 100))
        btn1.setTitle("启动灵动岛", for: .normal)
        btn1.setTitleColor(.red, for: .normal)
        btn1.addTarget(self, action: #selector(clicktBtn1), for: .touchUpInside)
        self.view.addSubview(btn1)
        
        let btn2 = UIButton(frame: CGRect(x: 10, y: 200, width: 200, height: 100))
        btn2.setTitle("更新灵动岛", for: .normal)
        btn2.setTitleColor(.red, for: .normal)
        btn2.addTarget(self, action: #selector(clicktBtn2), for: .touchUpInside)
        self.view.addSubview(btn2)

        let btn3 = UIButton(frame: CGRect(x: 10, y: 300, width: 200, height: 100))
        btn3.setTitle("停止灵动岛", for: .normal)
        btn3.setTitleColor(.red, for: .normal)
        btn3.addTarget(self, action: #selector(clicktBtn3), for: .touchUpInside)
        self.view.addSubview(btn3)
        
        
        
    }
    
    @objc func clicktBtn1(){
        if #available(iOS 16.1, *) {
            Task {
                await LiveActivityUtils.request()
            }
        } else {
            print("版本需要16.1")
        }
    }
    
    @objc func clicktBtn2() {
        
        switch self.state {
        case .hamburger:
            self.state = .tea
        case .tea:
            self.state = .cookies
        case .cookies:
            self.state = .hamburger
        }
        
        if #available(iOS 16.1, *) {
            LiveActivityUtils.update(self.state)
        } else {
            print("版本需要16.1")
        }
    }
    
    @objc func clicktBtn3(){
        if #available(iOS 16.1, *) {
            LiveActivityUtils.end()
        } else {
            print("版本需要16.1")
        }
    }
    

}
