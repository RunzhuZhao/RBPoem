//
//  AccountViewModel.swift
//  RBPoem
//
//  Created by Run on 2024/3/16.
//

import Foundation

class AccountViewModel: ObservableObject {
    let kLoginStatus: String = "kLoginStatus"
    let kUser: String = "kUser"
    
    @Published var isLogin: Bool = false {
        didSet {
            saveLoginStatus()
        }
    }
    @Published var user: User? {
        didSet {
            saveUser()
        }
    }
    
    
    init() {
        initLocalLoginStatus()
    }
    
    private func initLocalLoginStatus() {
        isLogin = UserDefaults.standard.bool(forKey: kLoginStatus)
        if isLogin {
            initUser()
        }
    }
    
    private func initUser() {
        guard let data = UserDefaults.standard.data(forKey: kUser),
              let user = try? JSONDecoder().decode(User.self, from: data) else {
            isLogin = false
            return
        }
        self.user = user
    }
    
    private func saveLoginStatus() {
        UserDefaults.standard.setValue(isLogin, forKey: kLoginStatus)
    }
    
    private func saveUser() {
        if let encodeData = try? JSONEncoder().encode(user) {
            UserDefaults.standard.setValue(encodeData, forKey: kUser)
        }
    }
}
