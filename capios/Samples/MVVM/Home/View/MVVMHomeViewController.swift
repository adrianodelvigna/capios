//
//  MVVMHomeViewController.swift
//  capios
//
//  Created by Adriano Del Vigna de Almeida on 6/17/19.
//  Copyright © 2019 Adriano. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MVVMHomeViewController: UIViewController {
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Exercício MVVM"
        
        createAccountButton.rx.tap
            .subscribe(
                onNext: { [weak self] _ in
                    if let createAccountViewController = R.storyboard.mvvmStoryboard.mvvmCreateAccountViewController() {
                        createAccountViewController.viewModel = CreateAccountViewModel()
                        self?.navigationController?.pushViewController(createAccountViewController, animated: true)
                    }
            }).disposed(by: disposeBag)
        
        loginButton.rx.tap
            .subscribe(
                onNext: { [weak self] _ in
                    if let loginViewController = R.storyboard.mvvmStoryboard.mvvmLoginViewController() {
                        loginViewController.viewModel = LoginViewModel()
                        self?.navigationController?.pushViewController(loginViewController, animated: true)
                    }
            }).disposed(by: disposeBag)
    }
}
