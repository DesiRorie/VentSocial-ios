//
//  UserCreatePost.swift
//  VentSocial
//
//  Created by Desi Rorie on 7/24/23.
//

import SwiftUI

struct UserCreatePost: View {
    @ObservedObject var viewModel:FeedImageViewModel
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) private var dismiss
    @State private var currentPostString: String = ""

    var body: some View {
        ZStack{
            VStack{
                HStack{
                    
                    Text("Cancel")
                        .onTapGesture {
                                dismiss()
                        }
                    Spacer()
                        .frame(width: 90)
                    
                    Text("New Post").bold()
                    Spacer()
                }
                .padding()
                Spacer().frame(height: 25)
                
                ZStack(alignment: .leading){
                    if currentPostString.isEmpty{
                        Text("Express yourself...")
                            .opacity(0.3)
                    }
                    TextField("", text: $currentPostString)
                }.padding(.horizontal,10)
                .padding(.vertical,5)
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.purple,lineWidth: 1))
                .padding(.horizontal,10)
                
                Button {
                    viewModel.addPost(currentPostString)
                    currentPostString = ""
                } label: {
                    Text("Post")
                }

                ForEach(viewModel.postsStore, id: \.self) { post in
                    Text(post)
                }
    
                    
                Spacer()
                        
                
            }
        }
    }
}
//
//struct UserCreatePost_Previews: PreviewProvider {
//    static var previews: some View {
//        UserCreatePost(viewModel: FeedImageViewModel())
//    }
//}
