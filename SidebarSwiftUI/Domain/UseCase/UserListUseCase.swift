//
//  UserListUseCase.swift
//  SandipTest
//
//  Created by Sandip on 05/03/24.
//

import Foundation

protocol UserListUseCase {
    func fetchUserData(fileName: String) -> Result<[UserDataModel], RequestError>
}

class UserListUseCaseImpl: UserListUseCase {
    let service: UserService
    
    init(service: UserService) {
        self.service = service
    }
    
    func fetchUserData(fileName: String) -> Result<[UserDataModel], RequestError> {
        return service.fetchUserData(fileName: fileName)
    }
    
    
}
