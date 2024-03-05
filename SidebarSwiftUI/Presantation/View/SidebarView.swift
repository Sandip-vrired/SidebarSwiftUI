//
//  SidebarView.swift
//  SandipTest
//
//  Created by Sandip on 05/03/24.
//

import SwiftUI

// Left sidebar view
struct SidebarView: View {
    
    @State var arrUserData: [UserDataModel]?
    @Binding var selectedUser: UserDataModel?
    
    var body: some View {
        List {
            ForEach((arrUserData)!.indices, id: \.self){
                index in
                Button(action: {
                    selectedUser = arrUserData?[index]
                }) {
                    Text(arrUserData?[index].name ?? "")
                }
            }
        }
        .listStyle(SidebarListStyle())
    }
}

