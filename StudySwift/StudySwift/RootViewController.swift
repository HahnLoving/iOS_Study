//
//  RootViewController.swift
//  StudySwift
//
//  Created by z Hahn on 2022/6/20.
//

import UIKit

class RootViewController: UIViewController {

    var tableView: UITableView = UITableView()
    var array: [CellType] = [.widget, .senior, .cgdTimer, .generic]
    
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
            cell.textLabel?.text = "小组件"
        case CellType.senior.rawValue:
            cell.textLabel?.text = "高阶函数"
        case CellType.cgdTimer.rawValue:
            cell.textLabel?.text = "CGD定时器"
        case CellType.generic.rawValue:
            cell.textLabel?.text = "泛型"
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
        default:
            break
        }
    }
}
