//
//  StyleSet.swift
//  FlowerArrangementv1.1
//
//  Created by 刘畅 on 2022/4/3.
//

/// 保存一些共享样式

import SwiftUI

// 用于MainView.SkillStudy.StudyButton
struct StyleOfStudyButton: ViewModifier {
    var ifPass: Bool = false
    func body(content: Content) -> some View {
            content
            .font(.system(size: 35))
            .foregroundColor(.black)
            .frame(width: 100, height: 150)
            .background(ifPass ? .yellow : .blue)
            .border(.black)
            .padding()
        }
}
