//
//  MasterSplitView.swift
//  SandipTest
//
//  Created by Sandip on 05/03/24.
//

import SwiftUI

struct MainView: View {
    @State var selectedUser: UserDataModel?
    @ObservedObject private var viewModel: MasterSplitViewModel
    
    init(service: UserListUseCase) {
        self._viewModel = ObservedObject(wrappedValue: MasterSplitViewModel(service: service))
    }
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                HStack {
                    if geometry.size.width > 250 {
                        SidebarView(arrUserData: viewModel.arrUserData, selectedUser: $selectedUser)
                            .frame(width: geometry.size.width / 2.5)
                    }
                    DetailView(userData: selectedUser)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .onAppear(){
                    viewModel.getUserInfo()
                }
            }
        }
    }
}

#Preview {
    MainView(service: UserListUseCaseImpl(service: UserServiceImpl()))
}
