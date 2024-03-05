//
//  ContentView.swift
//  SandipTest
//
//  Created by Sandip on 05/03/24.
//

import SwiftUI

struct DetailView: View {
    var userData: UserDataModel?
    
    var body: some View {
        if let selectedUser = userData {
            VStack(alignment: .leading, content: {
                Text("\((selectedUser.info?.title ?? "") + (selectedUser.name ?? ""))")
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                    .padding(.top, 30)
                Text("Age: \(selectedUser.info?.age ?? 0)")
                    .font(.system(size: 15))
                Text("Email: \(selectedUser.info?.email ?? "")")
                    .font(.system(size: 15))
                Text("Phone: \(selectedUser.info?.phone ?? "")")
                    .font(.system(size: 15))
                Spacer()
                
            })
            //            .navigationTitle("SplitView Demo")
            //                .navigationBarTitleDisplayMode(.inline)
        } else {
            Text("Select a name from the list")
        }
    }
}

struct DetailsView_Preview: PreviewProvider {
    static var previews: some View {
        DetailView(userData: UserDataModel(name: "Test", info: UserInfoModel(title: "Mr", age: 42, phone: "+8866134554", email: "test@test.com")))
    }
}
