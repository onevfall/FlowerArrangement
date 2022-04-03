//
//  LoginView.swift
//  FlowerArrangementv1.1
//
//  Created by 刘畅 on 2022/4/3.
//

/// 登陆界面

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        GeometryReader { geometry in
            let widthOfFatherView = geometry.size.width
            let heightOfFatherView = geometry.size.height
            VStack(alignment: .center, spacing: 0) {
                Image("LoginViewIcon",label: Text("Icon"))
                    .resizable()
                    .frame(width: widthOfFatherView / 3, height: heightOfFatherView / 6)
                Form {
                    TextField(text: $username, prompt: Text("Required")) {
                        Text("Username")
                    }
                    SecureField(text: $password, prompt: Text("Required")) {
                        Text("Password")
                    }
                    Text(username)
                    Text(password)
                }
                
                Button {
                    // 将username和password传递给数据库，并获取该用户的相关信息
                    // 或在数据库找不到该用户、或密码错误，则提示"用户名或密码错误"
                    // 或找到则直接进入MainView
                } label: {
                    Text("登陆")
                        .font(.largeTitle)
                }
                .cornerRadius(20)
                .border(.black)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
