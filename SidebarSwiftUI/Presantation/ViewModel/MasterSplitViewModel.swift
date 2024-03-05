//
//  MasterDetailsViewModel.swift
//  SandipTest
//
//  Created by Sandip on 05/03/24.
//

import Foundation
import Combine

class MasterSplitViewModel: ObservableObject {
    let service: UserListUseCase
    private lazy var subscriptions = Set<AnyCancellable>()
    @Published var arrUserData: [UserDataModel]?
    
    init(service: UserListUseCase) {
        self.service = service
    }
    
    func getUserInfo() {
        let result = service.fetchUserData(fileName: "data")
        switch result {
        case.success(let modelData):
            self.arrUserData = modelData
        case .failure(_): break
            
        }
    }
    
}
