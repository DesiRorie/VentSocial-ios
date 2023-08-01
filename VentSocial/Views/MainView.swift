//
//  MainView.swift
//  VentSocial
//
//  Created by Desi Rorie on 7/22/23.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = FeedImageViewModel()
    @State private var tabSelection: Int = 0
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        ZStack{
            VStack{
                VStack(spacing: 0){
                    
                    TabView(selection: $tabSelection) {
                        
                        HomeView(viewModel:viewModel)
                            .tabItem {
                                Image(systemName: "house.fill")
                                
                            }
//                            .toolbarBackground(colorScheme == .dark ? Color.black : Color.white, for: .tabBar)
                            .tag(0)
                        
                        VStack {
                            SearchbarView(viewModel:viewModel)
                        }
                        .tabItem {
                            Image(systemName: "magnifyingglass")
                        }
//                        .toolbarBackground(colorScheme == .dark ? Color.black : Color.white, for: .tabBar)
                        .tag(1)
                        
                        
                        VStack {
                            UserView(viewModel: viewModel)
                        }
                        .tabItem {
                            Image(systemName: "person.fill")
                            
                            
                        }
//                        .toolbarBackground(colorScheme == .dark ? Color.black : Color.white, for: .tabBar)
                        .tag(2)
                    }
//                    .toolbarBackground(colorScheme == .dark ? Color.black : Color.white, for: .tabBar) 
                    .accentColor(colorScheme == .dark ? Color.white : Color.black)
                    
                }
                
            }
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
        
    }
}

struct TopBar: View {
    @Environment (\.colorScheme) var colorScheme
    @ObservedObject var viewModel:FeedImageViewModel
    @State private var isPresented: Bool  = false
    var body: some View {
        HStack{
            Text("Vent Social").font(.system(size: 30)).bold()
            Spacer()
            NavigationLink(destination: LikedMemesView(viewModel:viewModel)) {
                Label(
                    title: { Text("Liked Posts") },
                    icon: { Image(systemName: "heart").font(.system(size: 25)) }
                )
                    .labelStyle(.iconOnly)
                
            }
            
            Spacer().frame(width: 10)
          
            NavigationLink(destination: UserMessagesView(viewModel: viewModel)) {
                Label(
                    title: { Text("Messages") },
                    icon: { Image(systemName: "message").font(.system(size: 25)) }
                )
                    .labelStyle(.iconOnly)
            }
            Image(systemName: "plus").font(.system(size: 25))
                .onTapGesture {
                    isPresented = !isPresented
                }
                .sheet(isPresented: $isPresented) {
                    UserCreatePost(viewModel: viewModel)
                        .presentationDetents([.medium,.large])
                }
        }.padding(.horizontal)
            .foregroundColor(colorScheme == .dark ? .white : .black)
    }
}
struct UserTopBar: View {
    @ObservedObject var viewModel:FeedImageViewModel
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        HStack{
            Text("DesiRorie123").font(.system(size: 25)).bold()
            Spacer()
            NavigationLink(destination: UserMessagesView(viewModel: viewModel)) {
                Label(
                    title: { Text("Liked Posts") },
                    icon: { Image(systemName: "heart").font(.system(size: 25)) }
                ).foregroundColor(colorScheme == .dark ? .white : .black)
                    .labelStyle(.iconOnly)
            }
            
            Spacer().frame(width: 10)
          
            NavigationLink(destination: UserMessagesView(viewModel: viewModel)) {
                Label(
                    title: { Text("Messages") },
                    icon: { Image(systemName: "message").font(.system(size: 25)) }
                ).foregroundColor(colorScheme == .dark ? .white : .black)
                    .labelStyle(.iconOnly)
            }
        }

    }
}

struct StoryCircle:View{
    var body: some View {
        ZStack{
            Circle()
                .stroke(LinearGradient(gradient: Gradient(colors: [.red, .orange]), startPoint: .leading, endPoint: .trailing), lineWidth: 6)
                .frame(width: 75)
            
            
        }
        
        
        
        
        
        
    }
}


struct StoryView: View {
    @ObservedObject var viewModel:FeedImageViewModel
    var body: some View {
        HStack{
            ScrollView(.horizontal, showsIndicators: false) {
                HStack{
                    //                    ForEach(viewModel.imageStore, id: \.self) { image in
                    //                        ZStack{
                    //                            StoryCircle(viewModel: FeedImageViewModel()).padding()
                    //
                    //                        }
                    //
                    //                    }
                    ForEach(viewModel.imageStore,id: \.self) { image in
                        HStack{ZStack{
                            StoryCircle()
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 75)
                                .clipShape(Circle())
                                
                                
                        }.padding(5)
                           
                        }
                    }
                }
            }
        }
    }
}
