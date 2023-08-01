//
//  UserMessagesView.swift
//  VentSocial
//
//  Created by Desi Rorie on 7/23/23.
//

import SwiftUI

struct UserMessagesView: View {
    @ObservedObject var viewModel:FeedImageViewModel
    var body: some View {
        VStack{
            Text("Show liked posts here here")
            Spacer()
            //display all liked images.
        }.navigationTitle("Liked Posts").bold()
    }
}

struct UserMessagesView_Previews: PreviewProvider {
    static var previews: some View {
        UserMessagesView(viewModel: FeedImageViewModel())
    }
}
