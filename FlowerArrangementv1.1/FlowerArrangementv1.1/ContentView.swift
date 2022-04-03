//
//  ContentView.swift
//  FlowerArrangementv1.1
//
//  Created by 刘畅 on 2022/4/3.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    var body: some View {
        MainView()
          }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
