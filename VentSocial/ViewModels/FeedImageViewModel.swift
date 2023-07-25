//
//  FeedImageViewModel.swift
//  VentSocial
//
//  Created by Desi Rorie on 7/23/23.
//

import Foundation
import SwiftUI
class FeedImageViewModel: ObservableObject{
    @Published var image:UIImage? = nil
    @Published var imageStore: [UIImage] = []
    @Published var imageInfo:String = ""
    @Published var isFetching:Bool = false
    @Published var postsStore:[String] = ["1"]
    
     func addPost(_ postInfo:String) {
        postsStore.append(postInfo)
    }

    @MainActor func fetchImage() async{
        guard let url = URL(string: "https://picsum.photos/200") else{return}
        
        do {
            isFetching = true
            for _ in 0..<50{
                //                guard let url = URL(string: "https://picsum.photos/200") else{return}
                let (data, _) = try await URLSession.shared.data(from: url)
                print(data)
                if let fetchedImage = UIImage(data: data){
                    DispatchQueue.main.async {
                        self.imageStore.append(fetchedImage)
                    }
                }
                isFetching = false
            }
            
            
        } catch  {
            isFetching = false
            print(error.localizedDescription)
        }
    }
}
