//
//  SampleViewModel.swift
//  RxTableView-Sample
//
//  Created by 木元健太郎 on 2022/06/08.
//

import Foundation
import RxSwift
import RxRelay

final class SampleViewModel {
    
    private var sampleModel = SampleModel.createModel()
    var rxModel = BehaviorRelay<[SampleModel]>(value: [])
    
    init() {
        rxModel.accept(sampleModel)
    }
}
