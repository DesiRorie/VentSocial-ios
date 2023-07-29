//
//  UserView.swift
//  VentSocial
//
//  Created by Desi Rorie on 7/23/23.
//

import SwiftUI

struct UserView: View {
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
        VStack{
            HStack {
                UserTopBar()
                Image(systemName: "plus").font(.system(size: 25))
                    .onTapGesture {
                        isPresented = !isPresented
                    }
                    .sheet(isPresented: $isPresented) {
                        UserCreatePost(viewModel: viewModel)
                            .presentationDetents([.medium,.large])
                    }
                //                    .padding(.horizontal,20)
                Spacer()
                
                Spacer()
                
            }
            
            .padding(0)
            Spacer()
                .frame(height: 30)
            UserInfoView()
            
            Spacer()
                .frame(height: 30)
            VStack {
                Text("Your Posts").bold()
                ScrollView{
                    LazyVGrid(columns: columns,spacing: 20) {
                        
                        
                        ForEach(viewModel.postsUserStore, id: \.id) { post in
                            VStack{
                                Text(post.text)
                                Text("\(post.formattedHour)")
                                Spacer()
                                    .frame(height: 5)
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                                    .onLongPressGesture(minimumDuration: 1) {
                                        viewModel.postsUserStore.removeAll { $0.id == post.id }
                                    }
                                
                            }
                            
                            
                        }
                        
                    }
                }
            }
            Spacer()
        }
        
    }
}


struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(viewModel: FeedImageViewModel())
    }
}
