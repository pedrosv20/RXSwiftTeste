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
import Foundation

final class ViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var button: UIButton!
    weak var coordinator: MainCoordinator?
    
    let disposeBag = DisposeBag()
    
    // final class
    // tudo let
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: TextField bind
        textField.rx.text
            .bind(to: labelText.rx.text)
            .disposed(by: disposeBag)
        
        
        //MARK: Button Actions
        
        button.rx.tap
            .bind {
                self.saveName()
                self.coordinator?.goToView()
                
        }.disposed(by: disposeBag)
        
    }
    
    
    func saveName() {
        let name = labelText.text
        
        if name != "" {
            
            var array = TextModel.sharedText.namesArray.value
            array.append(name!)
            TextModel.sharedText.namesArray.accept(array)
            
        }
    }
    
}










//  Driver

//        textField.rx.text.asObservable()
//            .subscribe(onNext: { text in
//                TextModel.sharedText.title.accept(text!)
//        }).disposed(by: disposeBag)
//
//        textField.rx.text.asDriver(onErrorJustReturn: nil)
//
//        TextModel.sharedText.title.asObservable()
//            .subscribe(onNext: { value in
//                self.labelText.text = value
//
//            }).disposed(by: disposeBag)
//
//dispose bag segura o alocamento de memoria. quando é tirado tudo se desaloca

//        let observable = textField.rx.text.asObservable()

//MARK: Terceira tentativa

//        observable
//            .bind(to: labelText.rx.text)
//            .disposed(by: disposeBag)


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

