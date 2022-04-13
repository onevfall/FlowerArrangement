//
//  LoginView.swift
//  FlowerArrangementv1.1
//
//  Created by 刘畅 on 2022/4/3.
//

/// 登陆界面

import SwiftUI

struct LoginView: View {
    
    /// [SQL]
    
    @ObservedObject var document: FlowerArrange

    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \User.username, ascending: true)],
        animation: .default)
    private var users: FetchedResults<User>
    
    /// [SQL]
    
    @State private var username: String = ""
    @State private var password: String = ""
    //@State private var ifLoginFailed: Bool = false
    //@State private var ifLoginIn: Bool = false
    @State private var ifShowAlert = false
    
    var body: some View {
        GeometryReader { geometry in
            let widthOfFatherView = geometry.size.width
            let heightOfFatherView = geometry.size.height
            VStack(alignment: .center, spacing: 0) {
                Image("LoginViewIcon",label: Text("Icon"))
                    .resizable()
                    .frame(width: widthOfFatherView / 3, height: heightOfFatherView / 6)
                Divider()
                Form {
                    TextField(text: $username, prompt: Text("用户名")) {
                        Text("Username")
                    }
                    SecureField(text: $password, prompt: Text("密码")) {
                        Text("Password")
                    }
                }
                HStack {
                    Button("登陆") {
                        // 将username和password传递给数据库，并获取该用户的相关信息
                        // 或在数据库找不到该用户、或密码错误，则提示"用户名或密码错误"
                        // 或找到则直接进入MainView
                        for user in users {
                            NSLog("Username = %@", user.username ?? "unknown")
                            NSLog("Password = %@ \n", user.password ?? "unknown")
                            ifShowAlert = true
                            if user.username == self.username && user.password == self.password {
                                // ifLoginIn.toggle()
                                ifShowAlert = false
                                document.userModel.loginStatus = .LoginIn(user: user) // 使用CoreData找到的user初始化
                                NSLog("username:" + user.username!)
                                document.runtimeModel.selectedView = 1 // 跳转到第一个页面
                                break // 跳出
                                //document.loadUserInformation(username: username, password: password) // 载入信息
                            }
                        }
                    }
                    .cornerRadius(20)
                    .border(.black)
                    .alert("用户名或密码错误", isPresented: $ifShowAlert) {
                        Button("确定") {
                            ifShowAlert = false
                        }
                    }
                    
                    Button("注册") {
                        // 注册账号，将账号信息存入数据库
                        for user in users {
                            if user.username == self.username {
                                ifShowAlert = true
                                break
                            }
                        }
                        if !ifShowAlert {
                            let newUser = User(context: viewContext)
                            newUser.username = self.username
                            newUser.password = self.password
                            do {
                                try viewContext.save()
                            } catch {
                                let nsError = error as NSError
                                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                            }
                        }
                    }
                    .cornerRadius(20)
                    .border(.black)
                    .alert("用户名已存在", isPresented: $ifShowAlert) {
                        Button("确定") {
                            ifShowAlert = false
                        }
                    }
                    Button {
                        document.userModel.loginStatus = .Visitor
                    } label: {
                        Text("退出登录")
                    }
                    .cornerRadius(20)
                    .border(.black)
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(document: FlowerArrange())
    }
}
