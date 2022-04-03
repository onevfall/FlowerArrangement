//
//  OpenView.swift
//  FlowerArrangementv1.1
//
//  Created by 刘畅 on 2022/4/3.
//

import SwiftUI

struct OpenView: View {
    var body: some View {
        ZStack {
            Image("OpenViewImage", label: Text("Welcome!"))
                .resizable()
            Text("插花艺术")
                .font(.system(size: 40))
                .foregroundColor(.white)
                .padding()
        }
    }
}

struct OpenView_Previews: PreviewProvider {
    static var previews: some View {
        OpenView()
    }
}
