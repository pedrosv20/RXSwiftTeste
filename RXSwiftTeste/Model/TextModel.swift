//
//  TextModel.swift
//  RXSwiftTeste
//
//  Created by Pedro Vargas on 18/02/20.
//  Copyright © 2020 Pedro Vargas. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class TextModel {
    
    static var sharedText = TextModel()
    
    var title = BehaviorRelay(value: "teste")
    
    var namesArray: BehaviorRelay = BehaviorRelay(value: ["pedro", "pedrinho", "ben10"])
    
    let a = PublishSubject()
    let b = BehaviorSubject(value: 0)
    
    private init() {
        
    }
}
