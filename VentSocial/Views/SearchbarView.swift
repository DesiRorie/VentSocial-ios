//
//  SearchbarView.swift
//  VentSocial
//
//  Created by Desi Rorie on 7/23/23.
//

import SwiftUI
import UIKit

struct SearchbarView: View {
    func saveImageToPhotosAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }
    @State private var showActionSheet = false
    @State private var scale: CGFloat = 1.0
    @State var selectedImage: UIImage? = nil
    @GestureState var press = false
    @State var show = false
    
@ObservedObject var viewModel:FeedImageViewModel
    var columns =   [
        GridItem(.flexible(),spacing: 10),
        GridItem(.flexible(),spacing: 10),
        GridItem(.flexible(),spacing: 10),
    ]
    
    var body: some View {
        VStack {
            UserTopBar()
                .padding(.horizontal,10)
            HStack {
                Text("Explore")
                    .bold()
                    .font(.subheadline)
                
            }.padding(.vertical,10)
                
            VStack{
             ScrollView(showsIndicators: false){
                VStack { if !viewModel.allMemeImages.isEmpty{
                    LazyVGrid(columns:columns,spacing: 10)
                    {
                        ForEach(viewModel.allMemeImages,id: \.self) { memeImage in
                            ZStack{
                                Rectangle()
                                Image(uiImage: memeImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .scaleEffect(selectedImage == memeImage ? scale : 1)
                                        .actionSheet(isPresented: $showActionSheet) {
                                            ActionSheet(title: Text("Save Image"), buttons: [
                                                .default(Text("Save")) {
                                                    saveImageToPhotosAlbum(image: memeImage)
                                                },
                                                .cancel(Text("Cancel"))
                                            ])
                                        }
//                                    .frame(width: 133, height: 133)
                            }
                            .zIndex(selectedImage == memeImage ? 1 : 0)
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
}

struct SearchbarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchbarView(viewModel: FeedImageViewModel())
    }
}
