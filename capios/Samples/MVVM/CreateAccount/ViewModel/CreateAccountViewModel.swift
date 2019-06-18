//
//  CreateAccountViewModel.swift
//  capios
//
//  Created by Adriano Del Vigna de Almeida on 6/17/19.
//  Copyright © 2019 Adriano. All rights reserved.
//

import Foundation
import RxSwift

class CreateAccountViewModel {
    public let username = BehaviorSubject<String?>(value: nil)
    public let password = BehaviorSubject<String?>(value: nil)
    
    public let createAccountEvent = PublishSubject<Void>()
    public let createAccountResult = PublishSubject<UserAccountResult>()
    
    public let areUsernameAndPasswordValid: Observable<Bool>
    
    public let disposeBag = DisposeBag()
    
    public init() {
        createAccountEvent.withLatestFrom(Observable.combineLatest(username, password) { ($0, $1) })
            .flatMap{ username, password -> Observable<UserAccountResult> in
                guard
                    let _username = username,
                    let _password = password
                    else { return Observable.error(NSError(domain: "Ops, entre com nome de usuário e senha", code: 666)) }
                
                let result = UserAccountOnKeychain.createWith(username: _username, andPassword: _password)
                return Observable.just(result)
            }
            .bind(to: createAccountResult)
            .disposed(by: disposeBag)
        
        areUsernameAndPasswordValid = Observable.combineLatest(username, password) { ($0, $1) }
            .debug()
//            .combineLatest(username, password) { username, password -> Bool in
//                guard
//                    let _username = username,
//                    let _password = password
//                    else { return false }
//
//                return UserAccountOnKeychain.isUsernameValid(_username) && UserAccountOnKeychain.isPasswordValid(_password)
//            }
            .map { username, password -> Bool in
                guard
                    let _username = username,
                    let _password = password
                    else { return false }
                
                return UserAccountOnKeychain.isUsernameValid(_username) && UserAccountOnKeychain.isPasswordValid(_password)
            }
    }
}
