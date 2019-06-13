//
//  ContactListViewController.swift
//  capios
//
//  Created by Francisco de Carvalho Costa Neto on 13/06/19.
//  Copyright © 2019 Adriano. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ContactListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
            tableView.register(R.nib.contactTableViewCell)
        }
    }
    
    var contactList: [Contact] = []
    
    let api: ContactAPI = ContactAPI()
    let disposeBag: DisposeBag = DisposeBag()
    
    var indicator: UIActivityIndicatorView!
    func createIndicator () {
        indicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        indicator.hidesWhenStopped = true
        indicator.center = self.view.center
        indicator.transform = CGAffineTransform(scaleX: 3, y: 3)
        self.view.addSubview(indicator)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createIndicator()
        
        indicator.startAnimating()
        api.rx_getContactData().subscribe(onNext: { [weak self] contactList in
            guard let `self` = self else { return }
            self.indicator.stopAnimating()
            self.contactList = contactList
            self.tableView.reloadData()
        }, onError: { [weak self] error in
            guard let `self` = self else { return }
            self.indicator.stopAnimating()
            let alert = UIAlertController(title: "Ixi! Deu erro", message: "Não foi possível recuperar a lista de contatos", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
                self.navigationController?.popViewController(animated: true)
            }))
            self.present(alert, animated: true, completion: nil)
        }).disposed(by: self.disposeBag)
    }
}

extension ContactListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.contactTableViewCell.identifier, for: indexPath) as? ContactTableViewCell {
            let contact = self.contactList[indexPath.row]
            cell.configCell(avatarImage: contact.contactAvatar, contactName: contact.contactName, contactPhoneNumber: contact.contactPhoneNumber)
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let vc = R.storyboard.trainingExercises.contactDetailsViewController() {
            vc.contact = self.contactList[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
