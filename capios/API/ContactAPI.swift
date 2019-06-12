//
//  ContactAPI.swift
//  capios
//
//  Created by Allan Wolff on 6/11/19.
//  Copyright © 2019 Adriano. All rights reserved.
//

import Foundation
import RxSwift
import SwiftyJSON

public enum CallType {
    case contactInfo
    case contactFullDetails
}

public struct ContactAPI {
    
    public func rx_getContactData() -> Observable<[Contact]> {
        return rx_APIRequest(call: .contactInfo).map { json in
            self.parseContacts(json: json)
        }
    }

}


extension ContactAPI {
    
    
    fileprivate func parseContacts(json: JSON) -> [Contact] {
        var contacts = [Contact]()
        
        if let contactArray = json["contacts"].array {
            for contact in contactArray {
                contacts.append(parseContact(json: contact))
            }
        }
        
        return contacts
    }
    
    
    fileprivate func parseContact(json: JSON) -> Contact {
        var contact = Contact()
        
        if let id = json["id"].int {
            contact.contactID = id
            
            if let image = getImage(with: id) {
                 contact.contactAvatar = image
            }
        }

        contact.contactName = json["name"].stringValue
        contact.contactPhoneNumber = json["phone"].stringValue
        
        return contact
    }
}


extension ContactAPI {
    
    fileprivate func rx_APIRequest(call: CallType) -> Observable<JSON> {
        switch call {
        case .contactFullDetails:
            return Observable.just(getJSONData()).delay(4.0, scheduler: MainScheduler.instance)
        case .contactInfo:
            return Observable.just(getJSONData()).delay(3.5, scheduler: MainScheduler.instance)
        }
    }
    
    fileprivate func getJSONData() -> JSON {
        
        let jsonString = "{ \"contacts\": [ { \"id\": 1, \"name\":\"Samuel L Jackson\", \"age\":70, \"phone\":\"+1 554 8878990\" }, { \"id\": 2, \"name\":\"Uma Thurman\", \"age\":49, \"phone\":\"+1 555 9978990\" }, { \"id\": 3, \"name\":\"Leonardo Di Caprio\", \"age\":44, \"phone\":\"+1 646 4430321\" }, { \"id\": 4, \"name\":\"John Travolta\", \"age\":65, \"phone\":\"+1 212 2235589\" }, { \"id\": 5, \"name\":\"Bruce Willis\", \"age\":64, \"phone\":\"+1 773 9987700\" } ] }"
        
        if let dataFromString = jsonString.data(using: .utf8, allowLossyConversion: false) {
            return try! JSON(data: dataFromString)
        }
        
        return JSON()
    }
    
    fileprivate func getImage(with id: Int) -> UIImage? {
        switch id {
        case 1:
            return UIImage(named: "samuel")
        case 2:
            return UIImage(named: "uma")
        case 3:
            return UIImage(named: "leonardo")
        case 4:
            return UIImage(named: "john")
        case 5:
            return UIImage(named: "bruce")
        default:
            return nil
        }
    }
}
