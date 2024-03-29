//
//  NetworkManager.swift
//  Vinyl
//
//  Created by Thomas Gray on 07/08/2022.
//

import Foundation
import SwiftUI

class NetworkManager {
    
    private var dataTask: URLSessionDataTask?
    private var dataTasks : [URLSessionDataTask] = []
    
    private func createURL(forTerm searchTerm: String) -> URL? {
        guard !searchTerm.isEmpty else {
            return nil
        }
        
        let queryItems = [
            URLQueryItem(name: "term", value: searchTerm),
            URLQueryItem(name: "entity", value: "album"),
        ]
        var components = URLComponents(string: "https://itunes.apple.com/search")
        components?.queryItems = queryItems
        return components?.url
    }
    
    func networkCall(searchTerm: String, completion: @escaping([Album]) -> Void) {
        self.dataTask?.cancel()
        guard let url = self.createURL(forTerm: searchTerm) else {
            completion([])
            return
        }
        
        self.dataTask = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else {
                completion([])
                return
            }
            
            if let response = try? JSONDecoder().decode(AlbumResponse.self, from: data) {
                completion(response.albums)
            }
        }
        self.dataTask?.resume()
    }
    
    func networkCall(forAlbum album: Album, completion: @escaping((Image?) -> Void)) {
        guard let imageUrl = URL(string: album.artworkUrl) else {
            completion(nil)
            return
        }
        
        self.dataTask = URLSession.shared.dataTask(with: imageUrl) { data, _, _ in
            guard let data = data, let artwork = UIImage(data: data) else {
                completion(nil)
                return
            }
            
            let image = Image(uiImage: artwork)
            completion(image)
        }
        
        guard let dataTask = self.dataTask else {
            completion(nil)
            return
        }
        
        self.dataTasks.append(dataTask)
        self.dataTask?.resume()
    }
    
    func reset() {
        self.dataTasks.forEach { $0.cancel() }
    }
}
