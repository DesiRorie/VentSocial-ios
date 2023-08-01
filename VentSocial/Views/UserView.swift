//
//  UserView.swift
//  VentSocial
//
//  Created by Desi Rorie on 7/23/23.
//

import SwiftUI

struct UserView: View {
    @Environment(\.colorScheme) var colorScheme
    var columns =   [
        GridItem(.flexible(),spacing: 10),
        GridItem(.flexible(),spacing: 10),
        GridItem(.flexible(),spacing: 10),
    ]
    func getCurrentTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: Date())
    }
    
    @ObservedObject var viewModel:FeedImageViewModel
    @State private var posts:[String] = ["Desi","Rorie","Kaylee","Perrin"]
    @State private var isPresented:Bool = false
    var body: some View {
        NavigationStack {
            VStack{
                TopBar(viewModel: viewModel)
                HStack {

                    Spacer()
                    
                    Spacer()
                    
                }
                Spacer()
                    .frame(height: 30)
                UserInfoView()
                
                Spacer()
                    .frame(height: 30)
                VStack {
                    viewModel.postsUserStore.isEmpty ? Text("You have no posts").bold() : Text("Your posts").bold()
                    ScrollView{
                        LazyVGrid(columns: columns,spacing: 10) {
                            
                            
                            ForEach(viewModel.postsUserStore, id: \.id) { post in
                                
                                    VStack{
                                        Text(post.text)
                                        Text("\(post.formattedHour)")
                                        Spacer()
                                            .frame(height: 5)
                                        Image(systemName: "trash")
                                            .foregroundColor(colorScheme == .dark ? .white : .black)
                                            .onLongPressGesture(minimumDuration: 1) {
                                                viewModel.postsUserStore.removeAll { $0.id == post.id }
                                            }
                                    }
                                    .frame(maxWidth: 133)
                                    .frame( maxWidth: 133, minHeight: 100, maxHeight: .none)
                                    
                                    
                                    
                                
                                .padding()
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .strokeBorder(lineWidth: 2)
                                            
                                        
                                            
                                )
                                
                            }
                            
                        }.padding()
                    }
                }
                Spacer()
            }
        }
        
    }
}


struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(viewModel: FeedImageViewModel())
    }
}
