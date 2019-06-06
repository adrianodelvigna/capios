//
//  RxOperatorsExerciseViewController.swift
//  capios
//
//  Created by Francisco de Carvalho Costa Neto on 20/05/19.
//  Copyright © 2019 Adriano. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

struct Product {
    var name: String = ""
    var price: Double = 0.0
    var id: Int = 0
}

struct SoldProduct {
    var quantity: Int = 0
    var name: String = ""
    var total: Double = 0.0
}

class RxOperatorsExerciseViewController: UIViewController {
    @IBOutlet weak var actionButton: UIButton!
    var regularArray: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    
    var productArray: [Product] = [Product(name: "Shampoo", price: 3.5, id: 0),
                                   Product(name: "Sabão", price: 1.5, id: 1),
                                   Product(name: "Arroz", price: 2.5, id: 2),
                                   Product(name: "TV", price: 3500.0, id: 3)]
    
    var productCount: Int = 5
    
    let disposeBag: DisposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        Operator_Map()
        Operator_Filter()
    }
    
    // MARK: - Demostração do uso do operador 'Map'.
    func Operator_Map() {
        //Multiplicação de todos os elementos de um array por 2
        print(regularArray)
        let newNumberArray = regularArray.map { value -> Int in
            value * 2
        }
        print(newNumberArray)
        
        //Conversão de um array de objetos, em um novo array de um diferente objeto
        print(productArray)
        let newProductArray = productArray.map({ product -> SoldProduct in
            SoldProduct(quantity: productCount, name: product.name, total: product.price * Double(productCount))
        })
        print(newProductArray)
    }
    
    // MARK: - Filter
    func Operator_Filter() {
        //Filtrando números que sejam múltiplos de 2
        print(regularArray)
        let newNumberArray = regularArray.filter { $0 % 2 == 0 }
        print(newNumberArray)
        
        //Filtrando um produtos que custem menos de 10 reais
        print(productArray)
        let newProductArray = productArray.filter { $0.price < 10.0 }
        print(newProductArray)
    }
    
    // MARK: - CombineLatest
    func Operator_CombineLatest() {
    }
}
