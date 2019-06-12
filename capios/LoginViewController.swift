//
//  LoginViewController.swift
//  capios
//
//  Created by Francisco de Carvalho Costa Neto on 07/06/19.
//  Copyright © 2019 Adriano. All rights reserved.
//

import UIKit
import Valet

class LoginViewController: UIViewController {
    @IBOutlet weak var usernameTxtField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func Login(_ sender: Any) {
        guard let kcIdentifier = Identifier(nonEmpty: "Database") else {
            print("Deu problema na criação do Identifier 'Database' para o Valet")
            return
        }
        let valet: Valet = Valet.valet(with: kcIdentifier,
                                       accessibility: .whenUnlocked)

        if let username = valet.string(forKey: "username"),
            let password = valet.string(forKey: "password"),
            let usernameField = self.usernameTxtField.text,
            let passwordField = self.passwordTextField.text {
            if username == usernameField && password == passwordField {
                print("Sucesso")
            } else {
                print("Fail")
            }
        }
    }
}
