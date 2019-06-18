//
//  MVVMLoginViewController.swift
//  capios
//
//  Created by Adriano Del Vigna de Almeida on 6/17/19.
//  Copyright © 2019 Adriano. All rights reserved.
//

import UIKit

class MVVMLoginViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    public var viewModel:LoginViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
