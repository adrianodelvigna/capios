//
//  UserAccountOnKeychain.swift
//  capios
//
//  Created by Adriano Del Vigna de Almeida on 6/17/19.
//  Copyright © 2019 Adriano. All rights reserved.
//

import Foundation

fileprivate let usernameKey = "username"
fileprivate let passwordKey = "password"

// MARK: - UserAccountOnKeychain implementation
class UserAccountOnKeychain: UserAccountProtocol {
    public static func createWith(username:String, andPassword password:String) -> UserAccountResult {
        if !SecureKeyValueStorage.hasKey(usernameKey) && !SecureKeyValueStorage.hasKey(usernameKey) {
            return SecureKeyValueStorage.saveUsername(username, andPassword: password) ? .success : .failure
        }
        return .failure
    }
    
    public static func loginWith(username:String, andPassword password:String) -> UserAccountResult {
        return SecureKeyValueStorage.hasUsername(username, andPassword: password) ? .success : .failure
    }
    
    public static func isUsernameValid(_ username:String) -> Bool {
        return username.count >= 6
    }
    
    public static func isPasswordValid(_ password:String) -> Bool {
        return password.count >= 6
    }
}

// MARK: - AppSecureKeyValueStorage extensions
fileprivate extension SecureKeyValueStorage {
    static func saveUsername(_ username:String, andPassword password:String) -> Bool {
        let savedUsername = saveKey(usernameKey, andString: username)
        let savedPassword = saveKey(passwordKey, andString: password)
        return savedUsername && savedPassword
        //TODO: implement rollback strategies in case on one failure
    }
    
    static func hasUsername(_ username:String, andPassword password:String) -> Bool {
        let hasUsername = getStringForKey(usernameKey) == username
        let hasPassword = getStringForKey(passwordKey) == password
        return hasUsername && hasPassword
    }
}
