//
//  UserAccountProtocol.swift
//  capios
//
//  Created by Adriano Del Vigna de Almeida on 6/17/19.
//  Copyright © 2019 Adriano. All rights reserved.
//

import Foundation

public protocol UserAccountProtocol {
    static func createWith(username:String, andPassword password:String) -> UserAccountResult
    static func loginWith(username:String, andPassword password:String) -> UserAccountResult
}

public enum UserAccountResult {
    case success, failure
}
