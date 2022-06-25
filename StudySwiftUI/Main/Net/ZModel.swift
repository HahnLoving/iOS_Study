//
//  ZModel.swift
//  MyWidgetExtension
//
//  Created by z Hahn on 2022/6/22.
//

import Foundation
import HandyJSON

struct ZModel: HandyJSON {
    var items: [ZQuiz] = []
}

struct ZQuiz: HandyJSON {
    
    var title : String = ""
    var subTitle : String = ""
    var icon : String = ""
    var correctRate : Int = 0
    var submit : Int = 0
    var starCount : Int = 0
}


