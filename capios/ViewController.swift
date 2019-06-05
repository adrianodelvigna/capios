//
//  ViewController.swift
//  capios
//
//  Created by Adriano Del Vigna on 08/05/19.
//  Copyright © 2019 Adriano. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    @IBOutlet weak var rxStudyButton: UIButton! {
        didSet{
            rxStudyButton.isAccessibilityElement = true
            rxStudyButton.accessibilityHint = "Estudo de operadores RxSwift"
        }
    }
    
    @IBOutlet weak var keyChainButton: UIButton! {
        didSet{
            keyChainButton.isAccessibilityElement = true
            keyChainButton.accessibilityHint = "Exercícios de Keychain"
        }
    }
    
    @IBOutlet weak var accessibilityButton: UIButton!
    
    var disposeBag: DisposeBag = DisposeBag()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        disposeBag = DisposeBag()
        
        rxStudyButton.rx.tap.subscribe(onNext: {
            if let vc = R.storyboard.main.rxOperatorsExerciseViewController() {
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }).disposed(by: self.disposeBag)
        
        keyChainButton.rx.tap.subscribe(onNext: {
            if let vc = R.storyboard.main.loginKeychainViewController() {
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }).disposed(by: self.disposeBag)
        
        accessibilityButton.rx.tap.subscribe(onNext: {
            if let vc = R.storyboard.main.accessibilityViewController() {
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }).disposed(by: self.disposeBag)
    }
}
