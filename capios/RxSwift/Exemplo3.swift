//
//  Exemplo3.swift
//  capios
//
//  Created by Allan Wolff on 6/11/19.
//  Copyright © 2019 Adriano. All rights reserved.
//

import UIKit
import RxSwift

class Exemplo3: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(R.nib.contactTableViewCell)
            tableView.isHidden = true
        }
    }
    
    var api = ContactAPI()
    var contactsArray = [Contact]()
    var disposeBag = DisposeBag()
    var indicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addIndicator()
        
        api.rx_getContactData().subscribe(
            onNext: { [weak self] contacts in
                self?.contactsArray = contacts
                self?.tableView.reloadData()
                self?.tableView.isHidden = false
                self?.indicator.stopAnimating()
                
            },
            onError: { error in
                print(error)
            }
            ).disposed(by: disposeBag)
    }
    
    func addIndicator() {
        indicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        indicator.hidesWhenStopped = true
        indicator.center = self.view.center
        indicator.transform = CGAffineTransform(scaleX: 3, y: 3)
        self.view.addSubview(indicator)
        indicator.startAnimating()
    }
}

extension Exemplo3: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.contactTableViewCell.identifier, for: indexPath) as? ContactTableViewCell {
            cell.configCell(avatarImage: contactsArray[indexPath.row].contactAvatar, contactName: contactsArray[indexPath.row].contactName, contactPhoneNumber: contactsArray[indexPath.row].contactPhoneNumber)
            return cell
        }
        return UITableViewCell()
    }
}
