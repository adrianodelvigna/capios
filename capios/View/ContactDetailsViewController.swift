//
//  ContactDetailsViewController.swift
//  capios
//
//  Created by Francisco de Carvalho Costa Neto on 13/06/19.
//  Copyright © 2019 Adriano. All rights reserved.
//

import UIKit

class ContactDetailsViewController: UIViewController {

    @IBOutlet weak var detailsTextView: UITextView!
    
    @IBOutlet weak var contactImageView: UIImageView!
    
    var contact: Contact?
    override func viewDidLoad() {
        super.viewDidLoad()

        if let _contact = contact {
            detailsTextView.text = _contact.contactFullDetails
            contactImageView.image = _contact.contactAvatar
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
