//
//  MemoryController.swift
//  StudySwift
//
//  Created by z Hahn on 2022/7/27.
//

import UIKit

/**
 内存管理机制
 https://mp.weixin.qq.com/s/lRCUC_eTYb5N1MUwyXKWHg
 */

class MemoryController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 创建对象
        var model = BaseModel()
        
        // 持有对象
        var model1: Any = model
        
        withUnsafePointer(to: &model) {ptr in print(ptr)}
        withUnsafePointer(to: &model1) {ptr in print(ptr)}
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
