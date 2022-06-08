//
//  SampleModel.swift
//  RxTableView-Sample
//
//  Created by 木元健太郎 on 2022/06/08.
//

import Foundation

struct SampleModel {
    var name:String?
    
    static func createModel() -> [SampleModel] {
        return [
            SampleModel(name: "sample"),
            SampleModel(name: "sample"),
            SampleModel(name: "sample"),
            SampleModel(name: "sample"),
            SampleModel(name: "sample"),
            SampleModel(name: "sample"),
            SampleModel(name: "sample"),
            SampleModel(name: "sample"),
            SampleModel(name: "sample")
        ]
    }
}
