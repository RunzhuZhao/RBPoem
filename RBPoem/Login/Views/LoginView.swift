//
//  LoginView.swift
//  RBPoem
//
//  Created by Run on 2024/3/16.
//

import SwiftUI

struct LoginView: View {
    var loginViewModel: LoginViewModel
    @State private var phoneNum: String = ""
    @State private var password: String = ""
    @FocusState private var phoneFieldIsFocus: Bool
    @State private var showAlert: Bool = false
    @State private var alertMsg: String = ""
    private var loginEnable: Bool {
        return !phoneNum.isEmpty && !password.isEmpty
    }
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ScrollView {
            VStack {
                TextField(LocalizedStringKey("Input username"), text: $phoneNum)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 1))
                    .focused($phoneFieldIsFocus)
                    .tint(.primary)
                    .padding(.bottom, 10)
                    
                TextField(LocalizedStringKey("Input password"), text:$password)
                    .padding()
                    .tint(.primary)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 1))
                    .padding(.bottom, 10)
                
                Button(action: {
                    login()
                }, label: {
                    Text("Login")
                        .foregroundStyle(.white)
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(loginEnable ? Color.black : Color.gray.opacity(0.5))
                        .cornerRadius(10)
                })
                .disabled(!loginEnable)
                
            }
            .padding(.top, 48)
            .padding(.horizontal, 20)
            
        }
        .navigationTitle("Login")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    func getAlert() -> Alert {
        Alert(title: Text(alertMsg))
    }
    func login() {
        guard loginEnable else {
            return
        }
        do {
            try loginViewModel.login(username: phoneNum, pwd: password)
//            dismiss()
        } catch LoginError.validatedError(let msg) {
            alertMsg = msg
            showAlert = true
        } catch {
            alertMsg = error.localizedDescription
            showAlert = true
        }
    }
}

#Preview {
    NavigationStack {
        LoginView(loginViewModel: LoginViewModel(accountModel: AccountViewModel()))
    }
}
