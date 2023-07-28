//
//  UserView.swift
//  VentSocial
//
//  Created by Desi Rorie on 7/23/23.
//

import SwiftUI

struct UserView: View {
    @ObservedObject var viewModel:FeedImageViewModel
    @State private var posts:[String] = ["Desi","Rorie","Kaylee","Perrin"]
    @State private var isPresented:Bool = false
    var body: some View {
        VStack{
            HStack {
                TopBar()
                Image(systemName: "plus").font(.headline)
                    .padding(.horizontal,10)
                    .onTapGesture {
                        isPresented = !isPresented
                    }
                    .sheet(isPresented: $isPresented) {
                        UserCreatePost(viewModel: viewModel)
                            .presentationDetents([.medium,.large])
                    }
                Spacer()
            }
            Spacer()
                .frame(height: 30)
            UserInfoView()
            Spacer()
            ScrollView(showsIndicators: false){
                VStack { if !viewModel.allMemeImages.isEmpty{
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 200))]){
                        ForEach(viewModel.allMemeImages,id: \.self) { memeImage in
                            ZStack{
                                Rectangle()
                                    
                                Image(uiImage: memeImage)
                                    .resizable()
                                    .scaledToFit()
                                    .aspectRatio(contentMode: .fit)
                                //                                .frame(minWidth: 200,maxWidth: 200,minHeight:200,maxHeight:200)
                                    .frame(width: 200, height: 200)
                            }
                                
                                
                        }
                    }
                }else{
                    ProgressView()
                }
                }   .onAppear {
                    Task{
                        await   viewModel.fetchMemeImage()
                 
                    }
                }
            }
        }
        
    }
}


struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(viewModel: FeedImageViewModel())
    }
}
