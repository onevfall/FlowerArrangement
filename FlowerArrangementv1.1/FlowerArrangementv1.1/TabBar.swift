//
//  TabBar.swift
//  FlowerArrangementv1.1
//
//  Created by 刘畅 on 2022/4/3.
//

import SwiftUI
import CoreData

struct TabBar: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \User.username, ascending: true)],
                  animation: .default)
    private var users: FetchedResults<User>
    
    // ViewModel 在程序入口处定义
    @ObservedObject var document: FlowerArrange
    
    
    var body: some View {
        
        TabView(selection: $document.runtimeModel.selectedView) {
            // 传给View的Document是否需要针对性？
            SkillStudy(document: document)
                .environment(\.managedObjectContext, viewContext)
                .tabItem {
                    Text("技法学习")
                }
                .tag(1)
            
            FreeDesign(document: document)
                .environment(\.managedObjectContext, viewContext)
                .tabItem {
                    Text("自由创作")
                }
                .tag(2)
            
            CommunityDuscuss(document: document)
                .environment(\.managedObjectContext, viewContext)
                .tabItem {
                    Text("社区讨论")
                }
                .tag(3)
            
            PersonCenter(document: document)
                .environment(\.managedObjectContext, viewContext)
                .tabItem {
                    Text("个人中心")
                }
                .tag(4)
            
            LoginView(document: document)
                .environment(\.managedObjectContext, viewContext)
                .tabItem {
                    Text("登陆")
                }
                .tag(5)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(document: FlowerArrange())
    }
}
