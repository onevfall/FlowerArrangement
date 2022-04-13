//
//  FADocument.swift
//  FlowerArrangementv1.1
//
//  Created by 刘畅 on 2022/4/8.
//

import Foundation
import UIKit
//import UIKit

class FlowerArrange: ObservableObject {
    
    let persistenceController = PersistenceController.shared
    
    @Published private(set) var userModel: UserModel
    @Published private(set) var runtimeModel: RuntimeModel
    
    var defaultUserImage: UIImage
    
    init() {
        // 初始化为游客模式，后期再使用”用户-密码“模式
        userModel = UserModel(loginStatus: .Visitor, staticModel: UserModel.StaticModel())
        
        //userModel = UserModel(loginStatus: .LoginIn(user: tUser(username: "星河不可及", password: "liuchang", image: UIImage(systemName: "person.fill")!)), staticModel: UserModel.StaticModel())
        
        defaultUserImage = UIImage(systemName: "person.fill")!
        runtimeModel = RuntimeModel(selectedView: 1)
    }
    
    // public or private or ...
//    func setLoginStatus(_ ifLoginIn: Bool) {
//        switch userModel.loginStatus {
//        case .LoginIn(let user):
//            return false
//        case .Visitor:
//
//        }
//        userModel.loginStatus =
//    }
    
    func loadUserInformation(username: String, password: String) -> Void {
        userModel.loginStatus = .LoginIn(user: tUser(username: username, password: password, image: defaultUserImage))
    }
    
    // 若游客，则username为nil
    var username: String? {
        get {
            switch userModel.loginStatus {
            case .LoginIn(let user):
                return user.username
            case .Visitor:
                return nil
            }
        }
    }
    var image: UIImage? {
        get {
            switch userModel.loginStatus {
            case .LoginIn(let user):
                return user.image
            case .Visitor:
                return nil
            }
        }
    }
    
    
    
}
