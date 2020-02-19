//
//  ViewController.swift
//  RXSwiftTeste
//
//  Created by Pedro Vargas on 18/02/20.
//  Copyright © 2020 Pedro Vargas. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    var disposeBag = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let observable = textField.rx.text.asObservable()
        
        
        //MARK: Terceira tentativa
        
        observable
            .bind(to: labelText.rx.text)
        .disposed(by: disposeBag)
        
        
        
        
        // MARK: Primeira Tentativa
        
//
//         observable.subscribe { event in
//
//            switch event {
//            case .next(let value):
//                self.labelText.text = value
//            case .error(let error):
//                print(error)
//            case .completed:
//                print("completed")
//            }
//        }
        
        // MARK: Segunda Tentativa


//
//        observable.subscribe(onNext: { text in
//            print(text)
//
//        })
//
//

        
    }


        

    
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        
    }

}

