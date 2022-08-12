//
//  AlbumViewModel.swift
//  Vinyl
//
//  Created by Thomas Gray on 12/08/2022.
//

import Foundation
import SwiftUI
import Combine

class AlbumViewModel: Identifiable, ObservableObject {
    
    let id: Int
    let albumName: String
    let artistName: String
    @Published var artwork: Image?
    
    init(album: Album) {
        self.id = album.id
        self.albumName = album.collectionName
        self.artistName = album.artistName
    }
}
