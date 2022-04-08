//
//  FADocument.swift
//  FlowerArrangementv1.1
//
//  Created by 刘畅 on 2022/4/8.
//

import Foundation
import UIKit

class FlowerArrange: ObservableObject {
    
    
    @Published private(set) var userModel: UserModel
    
    init() {
        
    }
    // 若游客，则username为nil
    var username: String? {
        switch userModel.loginStatus {
        case .Visitor:
            return nil
        case .LoginIn(User):
            return User.username
        }
    }
}
