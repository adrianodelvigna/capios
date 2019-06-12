//
//  Exemplo2.swift
//  capios
//
//  Created by Adriano Del Vigna de Almeida on 6/10/19.
//  Copyright © 2019 Adriano. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class Exemplo2: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    let disposeBag = DisposeBag()

    var counter = 0

    override func viewDidLoad() {
        super.viewDidLoad()

//        print("1. Começando a função viewDidLoad()")
//
//        let buttonTapObservable = button.rx.tap
//        print("2. Criado um observável para cada 'tap' no botão: \(buttonTapObservable)")
//
//        let buttonTapObserver = buttonTapObservable
//            .subscribe(
//                onNext: { [weak self] _ in
//                    print("--tap", terminator: "")
//                    self?.counter += 1
//                    print("(\(self?.counter ?? -1))", terminator: "")
//
//                    //self?.label.text = "Toques no botão: \(self?.counter ?? -1)"
//                },
//                onError: { error in print("--X (\(error.localizedDescription))") },
//                onCompleted: { print("--|") },
//                onDisposed: { print(" ..Memória desalocada...") })
//        print("3. Criado um observador para eventos de tap no botão: \(buttonTapObserver)")
//
//        buttonTapObserver.disposed(by: disposeBag)
//
//        let buttonTapObserver2 = buttonTapObservable
//            .map { [weak self] _ -> String in
//                self?.counter += 1
//                return "Toques: \(self?.counter ?? -1)"
//            }
//            .bind(to: label.rx.text)
//        buttonTapObserver2.disposed(by: disposeBag)

        button.rx.tap.map { [weak self] _ -> String in
            self?.counter += 1
            return "Toques: \(self?.counter ?? -1)"
        }.bind(to: label.rx.text).disposed(by: disposeBag)

        print("4. Terminando a função viewDidLoad()\n\n")
    }
}
