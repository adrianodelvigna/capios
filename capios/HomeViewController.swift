//
//  HomeViewController.swift
//  capios
//
//  Created by Francisco de Carvalho Costa Neto on 06/06/19.
//  Copyright © 2019 Adriano. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var createAccount: UIButton! {
        didSet {
            createAccount.layer.borderWidth = 1.0
            createAccount.layer.borderColor = UIColor.blue.cgColor
            createAccount.layer.cornerRadius = 10.0
        }
    }
    
    @IBOutlet weak var loginAccount: UIButton! {
        didSet {
            loginAccount.layer.borderWidth = 1.0
            loginAccount.layer.borderColor = UIColor.blue.cgColor
            loginAccount.layer.cornerRadius = 10.0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
