//
//  DataModel.swift
//  Vinyl
//
//  Created by Thomas Gray on 07/08/2022.
//

import Foundation

struct AlbumResponse: Decodable {
    let albums: [Album]
    
    enum CodingKeys: String, CodingKey {
        case albums = "results"
    }
}

struct Album: Decodable {
    let id: Int
    let artistName: String
    let collectionName: String
    let artworkUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id = "collectionId"
        case artistName
        case collectionName
        case artworkUrl = "artworkUrl60"
    }
}
