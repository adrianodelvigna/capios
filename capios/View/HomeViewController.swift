//
//  HomeViewController.swift
//  capios
//
//  Created by Francisco de Carvalho Costa Neto on 06/06/19.
//  Copyright © 2019 Adriano. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

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
    
    let disposeBag: DisposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "App Exercícios"
        
        createAccount.rx.tap.subscribe(onNext: {
            [weak self] in
            guard let `self` = self else { return }
            if let vc = R.storyboard.trainingExercises.createAccountViewController() {
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }).disposed(by: disposeBag)
        
        //EXERCICIO: FAÇAM O MESMO PARA LOGINVIEWCONTROLLER
        loginAccount.rx.tap.subscribe(onNext: {
            [weak self] in
            guard let `self` = self else { return }
            if let vc = R.storyboard.trainingExercises.loginViewController() {
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }).disposed(by: disposeBag)
    }
}
