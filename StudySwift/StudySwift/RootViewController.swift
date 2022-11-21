//
//  RootViewController.swift
//  StudySwift
//
//  Created by z Hahn on 2022/6/20.
//

import UIKit

class RootViewController: UIViewController {

    var tableView: UITableView = UITableView()
    var array: [CellType] = [.widget, .senior, .cgdTimer, .generic, .asyncAndAwait, .memory]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("name = \(self)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView = UITableView(frame: self.view.bounds)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.addSubview(self.tableView)
//        self.initGeneric()
//        self.initGCDTimer()
//        self.initSenior()
//        self.initWidget()
        
    }
    
}


extension RootViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        switch indexPath.row {
        case CellType.widget.rawValue:
            /**
             小组件
             https://mp.weixin.qq.com/s/_DF_s_j49yroLf-gIID0Tw
             */
            cell.textLabel?.text = "小组件"
        case CellType.senior.rawValue:
            /**
             Swift高阶函数
             https://mp.weixin.qq.com/s?__biz=Mzg5Mjc1ODI5Nw==&mid=2247483780&idx=1&sn=f420a148bd10502aae87b37a17bd79fb&chksm=c03871f2f74ff8e4a0733b20f5b81fd9204ee3b6f5ac0f986ff346803bb064a7da611d473362&token=147400309&lang=zh_CN#rd
             */
            cell.textLabel?.text = "高阶函数"
        case CellType.cgdTimer.rawValue:
            /**
             CGD定时器
             https://mp.weixin.qq.com/s/7cPyKK5_JtVEjT9Jvyp0gw
             */
            cell.textLabel?.text = "CGD定时器"
        case CellType.generic.rawValue:
            /**
             Swift 泛型
             https://mp.weixin.qq.com/s/yuzIVkUw_r2lOr2vONfgcA
             */
            cell.textLabel?.text = "泛型"
        case CellType.asyncAndAwait.rawValue:
            /**
             async/await 使用

             https://mp.weixin.qq.com/s?__biz=Mzg5Mjc1ODI5Nw==&mid=2247483861&idx=1&sn=2ba5ec9add95afb5b1510309955300a2&chksm=c03871a3f74ff8b55445de0432eba07f35b59ff085456b6e0993356de2163cbf436bbc9bc804&token=501291339&lang=zh_CN#rd
             */
            cell.textLabel?.text = "async/await"
        case CellType.memory.rawValue:
            /**
             内存管理机制
             https://mp.weixin.qq.com/s/lRCUC_eTYb5N1MUwyXKWHg
             */
            cell.textLabel?.text = "内存管理"
        case CellType.iap.rawValue:
            /**
             内存管理机制
             https://mp.weixin.qq.com/s/lRCUC_eTYb5N1MUwyXKWHg
             */
            cell.textLabel?.text = "IAP 内购"
        default:
            break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case CellType.widget.rawValue:
            let vc = WidgetController()
            vc.type = .widget
            self.navigationController?.pushViewController(vc, animated: true)
        case CellType.senior.rawValue:
            let vc = BaseController()
            vc.type = .senior
            self.navigationController?.pushViewController(vc, animated: true)
        case CellType.cgdTimer.rawValue:
            let vc = TimerController()
            vc.type = .cgdTimer
            self.navigationController?.pushViewController(vc, animated: true)
        case CellType.generic.rawValue:
            let vc = BaseController()
            vc.type = .generic
            self.navigationController?.pushViewController(vc, animated: true)
        case CellType.asyncAndAwait.rawValue:
            let vc = AsyncAndAwaitController()
            vc.type = .asyncAndAwait
            self.navigationController?.pushViewController(vc, animated: true)
        case CellType.memory.rawValue:
            let vc = MemoryController()
            vc.type = .memory
            self.navigationController?.pushViewController(vc, animated: true)
        case CellType.iap.rawValue:
            let vc = IAPController()
            vc.type = .iap
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
}
