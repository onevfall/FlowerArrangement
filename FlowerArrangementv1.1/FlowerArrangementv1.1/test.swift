//
//  LoginView.swift
//  FlowerArrangementv1.1
//
//  Created by 刘畅 on 2022/4/3.
//

/// 登陆界面

import SwiftUI

struct test: View {
    
    /// [SQL]
    
    @ObservedObject var document: FlowerArrange

    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \User.id, ascending: true)],
                  animation: .default)
    private var users: FetchedResults<User>
    
    /// [SQL]
    
    var body: some View {
        ScrollView {
            ForEach(users) { user in
                Text(user.username ?? "un")
                Text(user.password ?? "pw")
                Text(String(user.id))
            }
        }
    }
}
