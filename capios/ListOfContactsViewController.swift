//
//  ListOfContactsViewController.swift
//  capios
//
//  Created by Francisco de Carvalho Costa Neto on 12/06/19.
//  Copyright © 2019 Adriano. All rights reserved.
//

import UIKit

class ListOfContactsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.register(R.nib.contactTableViewCell)
        }
    }
    
    var contactList: [Contact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension ListOfContactsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1// contactList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.contactTableViewCell.identifier, for: indexPath) as? ContactTableViewCell {
            cell.configCell(avatarImage: R.image.gato()!, contactName: "Name", contactPhoneNumber: "Phone")
            
            return cell
        }
        
        return UITableViewCell()
    }
}
