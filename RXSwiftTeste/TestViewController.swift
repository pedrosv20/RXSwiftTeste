//
//  TestViewController.swift
//  RXSwiftTeste
//
//  Created by Pedro Vargas on 18/02/20.
//  Copyright © 2020 Pedro Vargas. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Foundation
import Moya


class TestViewController: UIViewController, Storyboarded {
    
    let tableView = UITableView()
    let disposeBag = DisposeBag()
    weak var coordinator: MainCoordinator?
    
    let provider = MoyaProvider<Names>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        provider.request(.getAllUsers){ result in
            
            switch result {
            case let .success(result):
                do {
                    let filteredResponse = try result.filterSuccessfulStatusCodes()
                    let json = try filteredResponse.map([Users].self)
                    print(json)
                    TextModel.sharedText.userArray = json
                    
                    self.addUsersInTableView()
                }
                catch let error {
                    print(error.localizedDescription)
                }
            case let .failure(error):
                
                
                print(error.errorDescription)
            }
            
            
            
        }
        // Do any additional setup after loading the view.
        view.addSubview(tableView)
        
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0.0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0.0),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0.0),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0.0)
        ])
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        TextModel.sharedText.namesArray.bind(to: tableView.rx.items(cellIdentifier: "cell")) { row, name, cell in
            cell.textLabel?.text = "\(name)"
        }.disposed(by: disposeBag)
    }
    
    func addUsersInTableView() {
        var array = TextModel.sharedText.namesArray.value
        
        for user in TextModel.sharedText.userArray {
            array.append(user.title)
        }
        TextModel.sharedText.namesArray.accept(array)
    }
    //teste
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
