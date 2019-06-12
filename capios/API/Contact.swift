//
//  Contact.swift
//  capios
//
//  Created by Allan Wolff on 6/9/19.
//  Copyright © 2019 Adriano. All rights reserved.
//

import Foundation
import UIKit

class Contact {
    var contactAvatar: UIImage
    var contactName: String
    var contactPhoneNumber: String
    var contactID: Int

    public init(contactAvatar: UIImage, contactName: String, contactPhoneNumber: String, contactID: Int) {
        self.contactAvatar = contactAvatar
        self.contactName = contactName
        self.contactPhoneNumber = contactPhoneNumber
        self.contactID = contactID
    }
}
