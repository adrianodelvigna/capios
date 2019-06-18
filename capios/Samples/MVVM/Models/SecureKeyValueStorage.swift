//
//  SecureKeyValueStorage.swift
//  capios
//
//  Created by Adriano Del Vigna de Almeida on 6/17/19.
//  Copyright © 2019 Adriano. All rights reserved.
//

import Foundation
import Valet

class SecureKeyValueStorage {
    public static let identifier: String = "AppSecureKeyValueDatabase"
    
    private static func getValet() -> Valet {
        return Valet.valet(with: Identifier(nonEmpty: identifier)!,
                           accessibility: .whenUnlocked)
    }
    
    public static func hasKey(_ key:String) -> Bool {
        let valet = getValet()
        return valet.canAccessKeychain() ? valet.containsObject(forKey: key) : false
    }
    
    public static func saveKey(_ key:String, andString string:String) -> Bool {
        let valet = getValet()
        return valet.canAccessKeychain() ? valet.set(string: string, forKey: key) : false
    }
    
    public static func getStringForKey(_ key:String) -> String? {
        let valet = getValet()
        return valet.canAccessKeychain() ? valet.value(forKey: key) as? String : nil
    }
    
    public static func removeStringForKey(_ key:String) -> Bool {
        let valet = getValet()
        return valet.canAccessKeychain() ? valet.removeObject(forKey: key) : false
    }
}
