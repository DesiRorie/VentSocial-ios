//
//  UserInfoView.swift
//  VentSocial
//
//  Created by Desi Rorie on 7/23/23.
//

import SwiftUI

struct UserInfoView: View {
    var body: some View {
        HStack(spacing:20){
            Circle()
                .frame(width: 75)
            Spacer().frame(width: 20)
                
            HStack(spacing:30){
                VStack(alignment: .center){
                    Text("100")
                    Text("Posts")
                }
                VStack(alignment: .center){
                    Text("100")
                    Text("Followers")
                }
                VStack(alignment: .center){
                    Text("100")
                    Text("Following")
                }
            }
            .font(.system(size: 15))
//            Spacer()
//                .frame(width: 10)
            
        }

    }
}

struct UserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoView().previewLayout(.sizeThatFits)
    }
}
