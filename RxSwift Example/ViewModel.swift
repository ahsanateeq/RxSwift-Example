//
//  ViewModel.swift
//  RxSwift Example
//
//  Created by Ahsan Ateeq on 08/11/2019.
//  Copyright © 2019 Example. All rights reserved.
//

import Foundation
import RxSwift
import RxRelay

class ViewModal {
    
    let arr: BehaviorRelay<[String]> = BehaviorRelay(value: [])
    let stringArray: Observable<[String]> = Observable.from(optional: ["arr1","arr2","arr3"])
    
    
    init() {
//        stringArray = arr.asObservable()
    }
    
    func addString(str: String) {
        arr.accept(arr.value + [str])
        
//        arr.value.append(str)
        
//        arr.value = arr.value + [str]
    }
    
}
