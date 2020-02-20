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

class TestViewController: UIViewController {

    let tableView = UITableView()
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
