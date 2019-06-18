//
//  LoginViewModel.swift
//  capios
//
//  Created by Adriano Del Vigna de Almeida on 6/17/19.
//  Copyright © 2019 Adriano. All rights reserved.
//

import Foundation
import RxSwift

class LoginViewModel {
    public let username = BehaviorSubject<String?>(value: nil)
    public let password = BehaviorSubject<String?>(value: nil)
    
    public let loginEvent = PublishSubject<Void>()
    public let loginResult = PublishSubject<UserAccountResult>()
    
    public let areUsernameAndPasswordValid: Observable<Bool>
    
    public let disposeBag = DisposeBag()
    
    public init() {
        loginEvent.withLatestFrom(Observable.combineLatest(username, password) { ($0, $1) })
            .flatMap{ username, password -> Observable<UserAccountResult> in
                guard
                    let _username = username,
                    let _password = password
                    else { return Observable.error(NSError(domain: "Ops, entre com nome de usuário e senha.", code: 666)) }
                
                let result = UserAccountOnKeychain.loginWith(username: _username, andPassword: _password)
                return Observable.just(result)
            }
            .bind(to: loginResult)
            .disposed(by: disposeBag)
        
        areUsernameAndPasswordValid = Observable
//            .combineLatest(username, password) { username, password -> Bool in
//                guard
//                    let _username = username,
//                    let _password = password
//                    else { return false }
//
//                return UserAccountOnKeychain.isUsernameValid(_username) && UserAccountOnKeychain.isPasswordValid(_password)
//            }
            .combineLatest(username, password) { ($0, $1) }
            .map { username, password -> Bool in
                guard
                    let _username = username,
                    let _password = password
                    else { return false }

                return UserAccountOnKeychain.isUsernameValid(_username) && UserAccountOnKeychain.isPasswordValid(_password)
        }
    }
}
