//
//  LikedPostsView.swift
//  VentSocial
//
//  Created by Desi Rorie on 7/23/23.
//

import SwiftUI

struct LikedPostsView: View {
    @ObservedObject var viewModel:FeedImageViewModel
    var columns =   [
        GridItem(.flexible(),spacing: 10),
        GridItem(.flexible(),spacing: 10),
        GridItem(.flexible(),spacing: 10),
    ]
    var body: some View {
        VStack{
            ScrollView( showsIndicators: false) {
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
        }.navigationTitle("Liked Posts")
    }
}

struct LikedPostsView_Previews: PreviewProvider {
    static var previews: some View {
        LikedPostsView(viewModel: FeedImageViewModel())
    }
}
