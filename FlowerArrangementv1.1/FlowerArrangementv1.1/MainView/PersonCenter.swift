//
//  PersonCenter.swift
//  FlowerArrangementv1.1
//
//  Created by 刘畅 on 2022/4/12.
//

import SwiftUI

struct PersonCenter: View {
    
    @ObservedObject var document: FlowerArrange
    
    var body: some View {
        switch document.userModel.loginStatus {
        case .Visitor:
            Text("请先登陆")
        case .LoginIn(let user):
            PersonInformationView(user: user, document: document)
        }
    }
    
    struct PersonInformationView: View {
        let user: User
        @ObservedObject var document: FlowerArrange
        var body: some View {
            // 头像user.image使用binary data存储
            // 转换过程 BinaryData-->UIImage-->Image
            VStack {
                HStack {
                    //Image(uiImage: user.image)
                    Text(user.username!)
                    Spacer()
                    Button {
                        // 修改个人信息
                    } label: {
                        Text("修改")
                    }
                    .padding()
                }
                .font(.largeTitle)
                Divider()
                HStack {
                    Button {
                        // 跳转 我发布的
                    } label: {
                        Text("我发布的")
                    }
                    
                    Button {
                        // 跳转 我收藏的
                    } label: {
                        Text("我收藏的")
                    }
                }
                Divider()
                VStack {
                    Text("我的历史作品")
                    // 预览我的作品
//                    ForEach(...) { in
//                        Image(...)
//                    }
                }
                Divider()
                Spacer()
                Button {
                    // 跳转 设置
                    document.runtimeModel.selectedView = 5
                    document.userModel.loginStatus = .Visitor
                } label: {
                    Text("登出")
                }

            }
            
            
        }
    }
}

struct PersonCenter_Previews: PreviewProvider {
    static var previews: some View {
        PersonCenter(document: FlowerArrange())
    }
}
