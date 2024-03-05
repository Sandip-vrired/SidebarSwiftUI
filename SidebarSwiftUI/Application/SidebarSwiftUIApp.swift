//
//  SidebarSwiftUIApp.swift
//  SidebarSwiftUI
//
//  Created by Sandip on 05/03/24.
//

import SwiftUI

@main
struct SidebarSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            MainView(service: UserListUseCaseImpl(service: UserServiceImpl()))
        }
    }
}
