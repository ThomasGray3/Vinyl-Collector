//
//  NetworkManager.swift
//  Vinyl
//
//  Created by Thomas Gray on 07/08/2022.
//

import Foundation

class NetworkManager {
    
    private var dataTask: URLSessionDataTask?
    
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
}
