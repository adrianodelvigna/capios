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
    @IBOutlet weak var rxStudyButton: UIButton!
    let disposeBag: DisposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rxStudyButton.rx.tap.subscribe(onNext: {
            if let vc = R.storyboard.main.rxOperatorsExerciseViewController() {
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }).disposed(by: self.disposeBag)
    }
}
