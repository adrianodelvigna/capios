//
//  MenuViewController.swift
//  capios
//
//  Created by Francisco de Carvalho Costa Neto on 13/06/19.
//  Copyright © 2019 Adriano. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MenuViewController: UIViewController {
    @IBOutlet weak var contactsButton: UIButton!
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.text = "Menu"
        }
    }
    
    let disposeBag: DisposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Bem-Vindo ao seu App"
        
        // Do any additional setup after loading the view.
        contactsButton.rx.tap.subscribe(onNext: {
            [weak self] in
            guard let `self` = self else { return }
            if let vc = R.storyboard.trainingExercises.contactListViewController() {
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }).disposed(by: self.disposeBag)
    }
}
