//
//  MainCoordinator.swift
//  RXSwiftTeste
//
//  Created by Pedro Vargas on 21/02/20.
//  Copyright © 2020 Pedro Vargas. All rights reserved.
//

import Foundation
import UIKit


class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        
        let vc = ViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func goToView() {
        let vc = TestViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
}
