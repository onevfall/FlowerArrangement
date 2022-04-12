//
//  LoginView.swift
//  FlowerArrangementv1.1
//
//  Created by 刘畅 on 2022/4/3.
//

/// 登陆界面

import SwiftUI

struct LoginView: View {
    
    /// [experiment]
    
    @ObservedObject var document: FlowerArrange

    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \User.id, ascending: true)],
                  animation: .default)
    private var users: FetchedResults<User>
    
    /// [experiment]
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var ifLoginFailed: Bool = false
    @State private var ifLoginIn: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            let widthOfFatherView = geometry.size.width
            let heightOfFatherView = geometry.size.height
            VStack(alignment: .center, spacing: 0) {
                Image("LoginViewIcon",label: Text("Icon"))
                    .resizable()
                    .frame(width: widthOfFatherView / 3, height: heightOfFatherView / 6)
                Form {
                    TextField(text: $username, prompt: Text("用户名")) {
                        Text("Username")
                    }
                    SecureField(text: $password, prompt: Text("密码")) {
                        Text("Password")
                    }
                    Text(username)
                    Text(password)
                }
                HStack {
                    Button {
                        // 将username和password传递给数据库，并获取该用户的相关信息
                        // 或在数据库找不到该用户、或密码错误，则提示"用户名或密码错误"
                        // 或找到则直接进入MainView
                        for user in users {
                            if user.username == self.username && user.password == self.password {
                                ifLoginIn.toggle()
                                document.loadUserInformation(un: username, pw: password)
                                break
                            }
                        }
                    } label: {
                        Text("登陆")
                            .font(.largeTitle)
                    }
                    .background(ifLoginFailed ? .red : .white)
                    .cornerRadius(20)
                    .border(ifLoginIn ? .blue : .black)
                    
                    Button {
                        // 注册账号，将账号信息存入数据库
                        let newUser = User(context: viewContext)
                        newUser.username = self.username
                        newUser.password = self.password
                        newUser.id = .zero
                        do {
                            try viewContext.save()
                        } catch {
                            let nsError = error as NSError
                            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                        }
                        
                    } label: {
                        Text("注册")
                            .font(.largeTitle)
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
