//
//  Coordinator.swift
//  RXSwiftTeste
//
//  Created by Pedro Vargas on 20/02/20.
//  Copyright © 2020 Pedro Vargas. All rights reserved.
//

import UIKit
import Foundation

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
