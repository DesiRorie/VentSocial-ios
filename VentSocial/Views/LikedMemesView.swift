//
//  LikedPostsView.swift
//  VentSocial
//
//  Created by Desi Rorie on 7/23/23.
//

import SwiftUI

struct LikedMemesView: View {
    @ObservedObject var viewModel:FeedImageViewModel
    var columns =   [
        GridItem(.flexible(),spacing: 10),
        GridItem(.flexible(),spacing: 10),
        GridItem(.flexible(),spacing: 10),
    ]
    var body: some View {
        VStack{
            ScrollView( showsIndicators: false) {
                VStack{
                 
                }
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.LikedMemeStore, id: \.self) { likedMeme in
                        ZStack{
                            Image(uiImage: likedMeme)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 133, height: 133)
                        }
                    }
                }
            }
        }.navigationTitle(Text(viewModel.LikedMemeStore.isEmpty ? "No Liked Posts" : "Liked Posts").bold())
    }
}

struct LikedMemesView_Previews: PreviewProvider {
    static var previews: some View {
        LikedMemesView(viewModel: FeedImageViewModel())
    }
}
