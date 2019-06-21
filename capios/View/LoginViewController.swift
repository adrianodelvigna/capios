//
//  LoginViewController.swift
//  capios
//
//  Created by Francisco de Carvalho Costa Neto on 07/06/19.
//  Copyright © 2019 Adriano. All rights reserved.
//

import UIKit
import Valet
import RxSwift
import RxCocoa

class LoginViewController: UIViewController {
    @IBOutlet weak var usernameTxtField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var confirmButton: UIButton!
    
    var disposeBag: DisposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        //CombineLatest, combina uma sequencia de observables, para uma única chamada.
        //É como se vocês fossem o Nestor Serveró sabe, aquele cara que consegue observar duas coisas ao mesmo tempo
        Observable.combineLatest(usernameTxtField.rx.text,
                                 passwordTextField.rx.text) {
                                    username, password -> Bool in
            if let _username = username,
                let _password = password {
                if _username.count > 0 && _password.count > 0 {
                    return true
                }
                return false
            }
                                    
            return false
        }
        .bind(to: self.confirmButton.rx.isEnabled)
        .disposed(by: self.disposeBag)
        
        confirmButton.rx.tap.subscribe(onNext: {
            guard let kcIdentifier = Identifier(nonEmpty: "Database") else {
                print("Deu problema na criação do Identifier 'Database' para o Valet")
                return
            }
            let valet: Valet = Valet.valet(with: kcIdentifier,
                                           accessibility: .whenUnlocked)
            
            if let username = valet.string(forKey: R.string.main.vaultUsernameKey()),
                let password = valet.string(forKey: R.string.main.vaultPasswordKey()),
                let usernameField = self.usernameTxtField.text,
                let passwordField = self.passwordTextField.text {
                if username == usernameField && password == passwordField {
                    if let vc = R.storyboard.trainingExercises.menuViewController() {
                        self.navigationController?.pushViewController(vc, animated: true)
                    }
                } else {
                    let invalidField = username != usernameField ? "'username'" : "'password'"
                    let alertMessage = "verifique se o campo \(invalidField) está preenchido corretamente"
                    let alert = UIAlertController(title: "Ixi! Deu erro",
                                                  message: alertMessage,
                                                  preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }).disposed(by: self.disposeBag)
    }
}
