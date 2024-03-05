//
//  UserDataModel.swift
//  SandipTest
//
//  Created by Sandip on 05/03/24.
//

import Foundation
struct UserDataModel: Codable {
    
    let name: String?
    let info: UserInfoModel?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case info = "info"
    }
}

struct UserInfoModel: Codable {
    let title: String?
    let age : Int?
    let phone : String?
    let email: String?
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case age = "age"
        case phone = "phone"
        case email = "email"
    }
}

