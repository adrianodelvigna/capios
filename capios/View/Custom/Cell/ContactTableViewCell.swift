//
//  ContactTableViewCell.swift
//  capios
//
//  Created by Allan Wolff on 6/9/19.
//  Copyright © 2019 Adriano. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    
    @IBOutlet weak var contactAvatarImageView: UIImageView!
    @IBOutlet weak var contactNameLabel: UILabel!
    @IBOutlet weak var contactPhoneNumberLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configCell(avatarImage: UIImage, contactName: String, contactPhoneNumber: String) {
        self.contactAvatarImageView.image = avatarImage
        self.contactAvatarImageView.contentMode = .scaleAspectFit
        self.contactNameLabel.text = contactName
        self.contactPhoneNumberLabel.text = contactPhoneNumber
    }
}
