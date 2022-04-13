//
//  FlowerArrangementv1_1App.swift
//  FlowerArrangementv1.1
//
//  Created by 刘畅 on 2022/4/3.
//

import SwiftUI

@main
struct FlowerArrangementv1_1App: App {
    
    let document = FlowerArrange()

    var body: some Scene {
        WindowGroup {
            TabBar(document: document)
                .environment(\.managedObjectContext,document.persistenceController.container.viewContext)
        }
    }
}
