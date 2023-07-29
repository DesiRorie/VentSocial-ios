//
//  FeedImageViewModel.swift
//  VentSocial
//
//  Created by Desi Rorie on 7/23/23.
//

import Foundation
import SwiftUI

struct Meme: Identifiable {
    let id: String
    let url: URL
}


class FeedImageViewModel: ObservableObject{
    @Published var image:UIImage? = nil
    @Published var imageStore: [UIImage] = []
    @Published var imageInfo:String = ""
    @Published var isFetching:Bool = false
    @Published var postsStore:[String] = []
    @Published var postIsLiked: Bool = false
    @Published var allMemeImages:[UIImage] = []
    enum CombinedItem:Hashable {
        case image(UIImage)
        case post(String)
    }


    var combinedArray: [CombinedItem] {
        var array: [CombinedItem] = []
        array.append(contentsOf: imageStore.map(CombinedItem.image))
        array.append(contentsOf: postsStore.map(CombinedItem.post))
        return array
    }
    @MainActor func refreshImages() async {
        imageStore = []
        await fetchImage()
    }
    
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
                
            }
            
            
        } catch  {
            isFetching = false
            print(error.localizedDescription)
        }
        
        isFetching = false
        
        
    }
    func removeFirstMeme() {
         if !allMemeImages.isEmpty {
             allMemeImages.removeFirst()
         }
     }
    func fetchMemeImage() async {
        guard let url = URL(string: "https://api.imgflip.com/get_memes") else { return }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedResponse = try JSONDecoder().decode(MemeResponse.self, from: data)
            var memes = decodedResponse.data.memes
            memes.shuffle()
            for meme in memes {
                if let url = URL(string: meme.url){
                    let (imageData, _ ) = try await URLSession.shared.data(from: url)
                    if let fetchedImage = UIImage(data: imageData) {
                        DispatchQueue.main.async {
                            self.allMemeImages.append(fetchedImage)
                        }
                    }
                }
            }
            
            
        }
            catch {
                print(error.localizedDescription)
            }
        }
    }
    struct MemeResponse: Codable {
        let success: Bool
        let data: MemeData
    }
    
    struct MemeData: Codable {
        let memes: [MemeInfo]
    }
    
    struct MemeInfo: Codable {
        let id: String
        let name: String
        let url: String
        let width: Int
        let height: Int
        let box_count: Int
        let captions: Int
    }
