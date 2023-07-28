//
//  HomeView.swift
//  VentSocial
//
//  Created by Desi Rorie on 7/22/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel:FeedImageViewModel
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        NavigationStack {
            VStack{
                VStack{
                    TopBar()
                    StoryView(viewModel:viewModel)
                    Rectangle()
                        .fill(.gray)
                        .frame(height: 0.18)
                }
                Spacer()
               
                  
                    .font(.headline).bold()
                TabView{
                    ScrollViewReader{ scrollProxy in
                        ScrollView(showsIndicators: false) {
                            VStack(){
                                if viewModel.isFetching{
                                    ProgressView()
                                    
                                }
                                LazyVStack {
                                    ForEach(viewModel.imageStore, id:\.self) { image in
                                        ZStack{
                                            Image(uiImage: image)
                                                .resizable()
                                                .scaledToFill()
                                        }
                                        Spacer().frame(height: 25)
                                    }
                                }
                                Image(systemName: "arrow.up")    .onTapGesture {
                                    withAnimation {
                                        scrollProxy.scrollTo(viewModel.imageStore.first!)
                                    }
                                }
                                
                            }
                            
                        }
                        .refreshable {
                           await viewModel.refreshImages()
                        }
                        .tag(0)
                    }
                
                    ScrollView(showsIndicators: false) {
                        VStack(){
                            LazyVStack {
                                ForEach(viewModel.postsStore, id:\.self) { posts in
                                  Text(posts)
                                    Spacer().frame(height: 25)
                                }
                            }

                        }
                        .onAppear{
                            viewModel.postsStore = viewModel.postsStore
                        }

                    }
                    .tag(1)
                
                }.tabViewStyle(.page(indexDisplayMode: .never))
          
            }.onAppear{
                Task{
                    await viewModel.fetchImage()}
            }

        }
    }
}


struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        HomeView(viewModel: FeedImageViewModel())
    }
}
