//
//  Exemplo1.swift
//  capios
//
//  Created by Adriano Del Vigna de Almeida on 6/10/19.
//  Copyright © 2019 Adriano. All rights reserved.
//

import UIKit
import RxSwift

class Exemplo1: UIViewController {
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        print("1. Começando a função viewDidLoad()")

        // Observável que gera eventos contendo um inteiro a cada segundo, na main thread (UI)
        let observable = Observable<Int>.interval(1.0, scheduler: MainScheduler.instance)
        print("2. Criado um observável: \(observable)")

        // Observador, que a cada inteiro gerado todo segundo, aplica uma
        // série de transformações a esse inteiro
        let observer = observable
            //.debug()                            // exibe informação de debug do inteiro emitido
            //.map { number in number * 10 }      // transforma cada inteiro, multiplicando-o por 10
            //.map { number in number % 2 == 0 ? "par" : "ímpar" }
            //.map { number in number % 2 == 0 }
            //.filter { number in return number > 4 }
            //.map { number in "Passou o número: \(number)" }
            //.debug()                            // exibe informação de debug depois da transf. via map
            //.takeWhile { number in number < 7 }
//            .flatMap { number -> Observable<Int> in
//                if number == 7 {
//                    return Observable.error(NSError(domain: "Ixi, deu erro", code: 400))
//                } else {
//                    return Observable.just(number)
//                }
//            }
//            .catchErrorJustReturn(-1)
//            .map { $0 + 13 }
//            .flatMap { number -> Observable<Int> in
//                if number == 7 {
//                    return Observable.error(NSError(domain: "IXIIII, MAIS UM ERRO!!", code: 777))
//                } else {
//                    return Observable.just(number)
//                }
//            }
//            .subscribe { event in               // recebe o resultado de todas as transf. e age de acordo
//                switch event {
//                case .next(let element): print("--\(element)", terminator: "")
//                case .completed: print("--| (Observable completed)")
//                case .error(let error): print("--X (\(error.localizedDescription))")
//                }
//            }
            .subscribe(
                onNext: {
                    print("--\($0)", terminator: "")
                },
                onError: { error in
                    print("--X (\(error.localizedDescription))")
                },
                onCompleted: {
                    print("--| (Observable completed)")
                },
                onDisposed: {
                    print(" ..Memória liberada")
                })

        observer.disposed(by: disposeBag)

        print("3. Criado um observador: \(observer)")

        print("4. Terminado com a função viewDidLoad()\n\n")
    }
}
