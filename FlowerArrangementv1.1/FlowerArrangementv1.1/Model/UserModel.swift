//
//  UserModel.swift
//  FlowerArrangementv1.1
//
//  Created by 刘畅 on 2022/4/8.
//

import Foundation
import CoreData

struct UserModel {
    enum LoginStatus {
        case LoginIn(User)
        case Visitor
    }
    var loginStatus: LoginStatus
}
