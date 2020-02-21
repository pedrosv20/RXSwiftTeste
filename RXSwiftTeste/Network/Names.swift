//
//  Names.swift
//  RXSwiftTeste
//
//  Created by Pedro Vargas on 21/02/20.
//  Copyright © 2020 Pedro Vargas. All rights reserved.
//

import Foundation
import Moya

enum Names {
    
    case getUser(id: Int)
    case getAllUsers
    
    
}

extension Names: TargetType {
    var baseURL: URL { return URL(string: "https://jsonplaceholder.typicode.com")! }
    var path: String {
        switch self {
        case .getUser(let id):
            return "/todos/\(id)"
        case .getAllUsers:
            return "/todos"
        }
    }
    var method: Moya.Method {
        switch self {
        case .getUser, .getAllUsers:
            return .get
            
        }
    }
    var task: Task {
        switch self {
            
        case .getUser, .getAllUsers: // Always sends parameters in URL, regardless of which HTTP method is used
            return .requestPlain
            
        }
    }
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
