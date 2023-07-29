//
//  UserView.swift
//  VentSocial
//
//  Created by Desi Rorie on 7/23/23.
//

import SwiftUI

struct UserView: View {
    var columns =   [
        GridItem(.fixed(200),spacing: 10),
        GridItem(.fixed(200))
    ]
    @ObservedObject var viewModel:FeedImageViewModel
    @State private var posts:[String] = ["Desi","Rorie","Kaylee","Perrin"]
    @State private var isPresented:Bool = false
    var body: some View {
        VStack{
            HStack {
                UserTopBar()
                Image(systemName: "plus").font(.system(size: 25))
//                    .padding(.horizontal,20)
                Spacer()
                    .onTapGesture {
                        isPresented = !isPresented
                    }
                    .sheet(isPresented: $isPresented) {
                        UserCreatePost(viewModel: viewModel)
                            .presentationDetents([.medium,.large])
                    }
                Spacer()
                    
            }
            .padding(0)
            Spacer()
                .frame(height: 30)
            UserInfoView()
            Spacer()
//            ScrollView(showsIndicators: false){
//                VStack { if !viewModel.allMemeImages.isEmpty{
//                    LazyVGrid(columns:columns)
//                    {
//                        ForEach(viewModel.allMemeImages,id: \.self) { memeImage in
//                            ZStack{
//                                Rectangle()
//                                Image(uiImage: memeImage)
//                                    .resizable()
//                                    .scaledToFit()
//                                    .aspectRatio(contentMode: .fit)
//                                //                                .frame(minWidth: 200,maxWidth: 200,minHeight:200,maxHeight:200)
//                                    .frame(width: 150, height: 150)
//                            }
//                            
//                            
//                        }
//                    }
//                }else{
//                    ProgressView()
//                }
//                }   .onAppear {
//                    Task{
//                        await   viewModel.fetchMemeImage()
//                        
//                    }
//                }
//            }
        }
        
    }
}


struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(viewModel: FeedImageViewModel())
    }
}
