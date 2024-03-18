//
//  LoginViewModel.swift
//  RBPoem
//
//  Created by Run on 2024/3/16.
//

import Foundation

class LoginViewModel: ObservableObject {
    var accountModel: AccountViewModel
    
    init(accountModel: AccountViewModel) {
        self.accountModel = accountModel
    }
    
    func login(username: String, pwd: String) throws {
        guard username.count > 0 else {
            throw LoginError.validatedError(msg: "用户名不能为空")
        }
        guard pwd.count > 0 else {
            throw LoginError.validatedError(msg: "密码不能为空")
        }
        accountModel.user = User(name: "User")
        accountModel.isLogin = true
    }
}
