//
//  MVVMCreateAccountViewController.swift
//  capios
//
//  Created by Adriano Del Vigna de Almeida on 6/17/19.
//  Copyright © 2019 Adriano. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MVVMCreateAccountViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var createAccountButton: UIButton!
    
    public var viewModel:CreateAccountViewModel!
    
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTextField.rx.text
            .bind(to: viewModel.username)
            .disposed(by: disposeBag)
        
        passwordTextField.rx.text
            .bind(to: viewModel.password)
            .disposed(by: disposeBag)
        
        viewModel
            .areUsernameAndPasswordValid
            .debug()
            .do(
                onNext: { [weak self] isValid in
                    self?.errorLabel.isHidden = isValid
            })
            .map { isValid -> String in
                return isValid ? "" : "Os campos devem possuir no mínimo 6 caracteres."
            }
            .bind(to: errorLabel.rx.text)
            .disposed(by: disposeBag)
        
        createAccountButton.rx.tap
            .bind(to: viewModel.createAccountEvent)
            .disposed(by: disposeBag)
        
        viewModel.createAccountResult
            .subscribe(
                onNext: { userAccountResult in
                    switch userAccountResult {
                    case .success:
                        let alert = UIAlertController(title: "Sucesso!", message: "Conta criada com sucesso!", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    case .failure:
                        let alert = UIAlertController(title: "Erro!", message: "Não foi possível\nsalvar a nova conta.", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                    
            },
                onError: { error in
                    
            })
            .disposed(by: disposeBag)
    }
}
