//
//  ContentView.swift
//  RBPoem
//
//  Created by Run on 2024/3/16.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var accountViewModel: AccountViewModel
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("古诗词内容显示")
                Text("古诗词内容显示")
                Text("古诗词内容显示")
            }
            .padding()
        }
        .navigationTitle(LocalizedStringKey("Welcome"))
        .navigationBarItems(trailing: Text(accountViewModel.user?.name ?? "User"))
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
    .environmentObject(AccountViewModel())
}
