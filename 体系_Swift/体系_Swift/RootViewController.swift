//
//  RootViewController.swift
//  体系_Swift
//
//  Created by z Hahn on 2022/6/20.
//

import UIKit

class RootViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("name = \(self)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        
        
        // MARK: CGD定时器
//        let btn = UIButton()
//        btn.setTitleColor(.red, for: .normal)
//        btn.setTitle("CGD定时器", for: .normal)
//        btn.frame = CGRect(x: 0, y: 100, width: 100, height: 100)
//        btn.addTarget(self, action: #selector(clicktBtn), for: .touchUpInside)
//        self.view.addSubview(btn)
        
        // MARK: Swift高阶函数
//        // map
//        mapDemo()
//        mapListDemo()
//        
//        // flatMap
//        flatMapDemo()
//        flatMapListDemo()
//
//        // compactMap
//        compactMapDemo()
//        compactMapListDemo()
//
//        
//        // map 和 flatMap 和 compactMap区别
//        mapAndFlatMapAndCompactMapDiffent()
//
//        // reduce
//        reduceDemo()
//
//        // filter
//        filterDemo()
//
//        // shuffled
//        shuffledDemo()
        
        // prefix
        prefixDemo()
        
        // suffix
        suffixDemo()
    }
    

    @objc func clicktBtn() {
        let vc = TimerController()
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
