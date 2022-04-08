//
//  FlowerArrangementv1_1App.swift
//  FlowerArrangementv1.1
//
//  Created by 刘畅 on 2022/4/3.
//

import SwiftUI

@main
struct FlowerArrangementv1_1App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            TabBar()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
