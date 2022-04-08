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
    
    @ObservedObject var document = FlowerArrange(viewContext)
    

/// 好像无法使用枚举？
//    @State private enum selectedView {
//        case skill_study
//        case free_design
//        case community_discussion
//        case person_center
//    }
    
    @State private var selectedView = 1
    
    
    var body: some View {
        TabView(selection: $selectedView) {
            SkillStudy()
                .tabItem {
                    Text("技法学习")
                }
                .tag(1)
            FreeDesign()
                .tabItem {
                    Text("自由创作")
                }
                .tag(2)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TabBar().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
