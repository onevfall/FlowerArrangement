//
//  LoginView.swift
//  FlowerArrangementv1.1
//
//  Created by 刘畅 on 2022/4/3.
//

/// 登陆界面

import SwiftUI

struct DestinationView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode> // 目前已被废弃
    var body: some View {
        Text("Destination View")
            .navigationBarHidden(false)
            .navigationTitle("Title-1")
            .onTapGesture {
                self.presentationMode.wrappedValue.dismiss()
            }
    }
}


struct test: View {
    
    /// [SQL]
    
    @ObservedObject var document: FlowerArrange

    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \User.password, ascending: true)],
                  animation: .default)
    private var users: FetchedResults<User>
    
    /// [SQL]
    
    // 定义一个ButtonStyle，命名为DefaultButtonStyle
    struct DefaultButtonStyle: ButtonStyle {
        func makeBody(configuration: Self.Configuration) -> some View {
          configuration.label
            .background(configuration.isPressed ? Color.clear : Color.clear)
        }
    }


    
    var body: some View {
        TabView {
            Text("The First Tab")
                .badge(10)
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("First")
                }
            Text("Another Tab")
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Second")
                }
            Text("The Last Tab")
                .tabItem {
                    Image(systemName: "3.square.fill")
                    Text("Third")
                }
        }
        .font(.headline)
//        ScrollView {
//            ForEach(users) { user in
//                // 每个user的id不能相同！
//                Text(user.username ?? "unknown")
//                Text(user.password ?? "unknown")
//                Divider()
//            }
//        }
        
        
    }
}
