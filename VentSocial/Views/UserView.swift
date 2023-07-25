//
//  UserView.swift
//  VentSocial
//
//  Created by Desi Rorie on 7/23/23.
//

import SwiftUI

struct UserView: View {
    @State private var posts:[String] = ["Desi","Rorie","Kaylee","Perrin"]
    @State private var isPresented:Bool = false
    var body: some View {
        VStack{
            HStack {
                TopBar()
                Image(systemName: "plus").font(.headline)
                    .onTapGesture {
                        isPresented = !isPresented
                    }
                    .sheet(isPresented: $isPresented) {
                        UserCreatePost()
                    }
                Spacer()
            }
            Spacer()
                .frame(height: 30)
            UserInfoView()
            Spacer()
       
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
