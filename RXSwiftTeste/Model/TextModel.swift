//
//  TextModel.swift
//  RXSwiftTeste
//
//  Created by Pedro Vargas on 18/02/20.
//  Copyright © 2020 Pedro Vargas. All rights reserved.
//

import Foundation
import RxSwift


class TextModel {
    
    static var sharedText = TextModel()
    
    var title = Observable.just("Title tex")
    var subscribe: Disposable
    
    private init() {
        subscribe = title.subscribe { event in
            print(event)
        }
        
    }
    
}
