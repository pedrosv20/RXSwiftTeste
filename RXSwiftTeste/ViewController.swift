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

final class ViewController: UIViewController {
    
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var button: UIButton!
    
    let disposeBag = DisposeBag()
    
    // final class
    // tudo let
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Driver
        
        textField.rx.text.asObservable()
            .subscribe(onNext: { text in
                TextModel.sharedText.title.accept(text!)
        }).disposed(by: disposeBag)
        
        textField.rx.text.asDriver(onErrorJustReturn: nil)
            
        TextModel.sharedText.title.asObservable()
            .subscribe(onNext: { value in
                self.labelText.text = value

            }).disposed(by: disposeBag)
        
            //dispose bag segura o alocamento de memoria. quando é tirado tudo se desaloca
        
        
        
        
        
        //MARK: Button Actions
        button.rx.tap
            .bind {
                var name = TextModel.sharedText.title.value
                var array = TextModel.sharedText.namesArray.value
                array.append(name)
                TextModel.sharedText.namesArray.accept(array)
                self.performSegue(withIdentifier: "goToView", sender: self)
        }.disposed(by: disposeBag)
        
        
        
        
        
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
        
    }
    
    
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        
    }
    
}

