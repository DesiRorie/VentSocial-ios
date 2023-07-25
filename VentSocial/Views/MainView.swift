//
//  MainView.swift
//  VentSocial
//
//  Created by Desi Rorie on 7/22/23.
//

import SwiftUI

struct MainView: View {
    @State private var tabSelection: Int = 0
    @Environment(\.colorScheme) var colorScheme
    //    enum Tab {
    //        case home
    //        case search
    //        case user
    //    }
    var body: some View {
        ZStack{
            VStack{
                VStack(spacing: 0){
                    
                    TabView(selection: $tabSelection) {
                        
                        HomeView()
                            .tabItem {
                                Image(systemName: "house.fill")
                                
                            }.toolbarBackground(colorScheme == .dark ? Color.black : Color.white, for: .tabBar)
                            .tag(0)
                        
                        VStack {
                            SearchbarView()
                        }
                        .tabItem {
                            Image(systemName: "magnifyingglass")
                        }
                        .toolbarBackground(colorScheme == .dark ? Color.black : Color.white, for: .tabBar)
                        .tag(1)
                        
                        
                        VStack {
                            UserView()
                        }
                        .tabItem {
                            Image(systemName: "person.fill")
                            
                            
                        }
                        .toolbarBackground(colorScheme == .dark ? Color.black : Color.white, for: .tabBar)
                            .tag(2)
                    }
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
    var body: some View {
        HStack{
            Text("Vent Social").font(.system(size: 30)).bold()
            Spacer()
            NavigationLink(destination: UserMessagesView()) {
                Label(
                    title: { Text("Liked Posts") },
                    icon: { Image(systemName: "heart").font(.system(size: 25)) }
                ).foregroundColor(.white)
                .labelStyle(.iconOnly)
                //                    .foregroundColor(.white)
            }
            
            Spacer().frame(width: 10)
            //            NavigationLink("Hello") {
            //                UserMessagesView()
            //            }
            NavigationLink(destination: UserMessagesView()) {
                Label(
                    title: { Text("Messages") },
                    icon: { Image(systemName: "message").font(.system(size: 25)) }
                ).foregroundColor(.white)
                .labelStyle(.iconOnly)
            }
        }.padding(.horizontal)
    }
}

struct StoryCircle:View{
    var body: some View {
        ZStack{
            Circle()
                .stroke(LinearGradient(gradient: Gradient(colors: [.red, .orange]), startPoint: .leading, endPoint: .trailing), lineWidth: 8)
            
                .frame(width: 75)
            Circle()
            
                .frame(width: 75)
            
        }
    }
}

struct StoryView: View {
    var body: some View {
        HStack{
            ScrollView(.horizontal, showsIndicators: false) {
                HStack{
                    ForEach(0..<10) { profileStory in
                        StoryCircle().padding()
                        
                    }
                }
            }
        }
    }
}
