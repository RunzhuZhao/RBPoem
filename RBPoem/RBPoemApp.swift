//
//  RBPoemApp.swift
//  RBPoem
//
//  Created by Run on 2024/3/16.
//

import SwiftUI

@main
struct RBPoemApp: App {
    @StateObject var accountViewModel: AccountViewModel = AccountViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                if accountViewModel.isLogin {
                    ContentView()
                } else {
                    LoginView(loginViewModel: LoginViewModel(accountModel: accountViewModel))
                }
            }
            .environmentObject(accountViewModel)
            
        }
    }
}
