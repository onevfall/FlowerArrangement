//
//  UserModel.swift
//  FlowerArrangementv1.1
//
//  Created by 刘畅 on 2022/4/8.
//

import Foundation
import SwiftUI
import CoreData

// testUser 用于模拟测试真实数据库中的用户

struct UserModel {
    
    // 登陆状态
    enum LoginStatus {
        case LoginIn(user: User)
        case Visitor
    }
    
    // APP Static Status
    struct StaticModel {
        init() {}
        
        // 技法学习完成情况，仅保存数据，具体样式在View中体现
        var ifJiFa1Pass: Bool = true
        var ifJiFa2Pass: Bool = false
        var ifJiFa3Pass: Bool = true
        var ifJiFa4Pass: Bool = true
        var ifJiFa5Pass: Bool = true
        var ifJiFa6Pass: Bool = true

        // 已有作品
        // 已发布帖子（评论点赞信息等）
    }
    
    var loginStatus: LoginStatus // 登陆状态，包含了用户类User
    var staticModel: StaticModel // 静态模型
}
