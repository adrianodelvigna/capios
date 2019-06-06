//
//  KeychainWraperCap.swift
//  capios
//
//  Created by Francisco de Carvalho Costa Neto on 31/05/19.
//  Copyright © 2019 Adriano. All rights reserved.
//

import Foundation
import Security

class KeychainWraperCap: NSObject {
    func setupSearchDirectoryForIdentifier(_ identifier: String) -> NSMutableDictionary {
        //Configuração do dicionário para acessar o keychain
        let searchDictionary = NSMutableDictionary()
        
        //Diz que iremos armazenar uma 'senha'. Existem varios tipos de dados, kSecClassCertificate, kSecClassInternetPassword...
        searchDictionary.setObject(kSecClassGenericPassword, forKey: kSecClass as! NSCopying)
        
        //um identificador único para o acesso ao keychain
        searchDictionary.setObject("CAPiOS", forKey: kSecAttrService as! NSCopying)
        
        return searchDictionary
    }
    
    func searchKeychainCopyMatchingIdentifier(_ identifier: String) -> Data {
        return Data()
    }
    
    func keychainStringFromMatchingIdentifier(_ identifier: String) -> String {
        return ""
    }
    
    func createKeychainValue(_ value: String, for identifier: String) -> Bool {
        return true
    }
    
    func updateKeychainValue(_ value: String, for identifier: String) -> Bool {
        return true
    }
    
    func deleteItemFromKeychainWithIdentifier(_ identifier: String) {
    
    }
    
    func computeSHA256DigestForString(_ input: String) -> String {
        return ""
    }
}
