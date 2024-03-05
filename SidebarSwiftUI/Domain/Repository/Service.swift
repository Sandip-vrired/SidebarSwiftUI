//
//  Service.swift
//  SandipTest
//
//  Created by Sandip on 05/03/24.
//

import Foundation

protocol UserService {
    func fetchUserData(fileName: String) -> Result<[UserDataModel], RequestError>
}

class UserServiceImpl: JsonFileHandler,UserService {
   
    func fetchUserData(fileName: String) -> Result<[UserDataModel], RequestError> {
        return  loadJson(filename: fileName,
                                              extensionType: .json,
                                              responseModel: [UserDataModel].self)
    }
}
