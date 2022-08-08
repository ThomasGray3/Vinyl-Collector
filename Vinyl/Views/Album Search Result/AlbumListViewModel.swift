//
//  AlbumListViewModel.swift
//  Vinyl
//
//  Created by Thomas Gray on 07/08/2022.
//

import Foundation
import SwiftUI
import Combine

class AlbumListViewModel: ObservableObject {
    @Published var searchTerm: String = ""
    @Published public private(set) var albums: [AlbumViewModel] = []
    
    private let dataModel: NetworkManager = NetworkManager()
    private var disposables = Set<AnyCancellable>()
    
    init() {
        $searchTerm
            .sink(receiveValue: loadAlbums(searchTerm:))
            .store(in: &disposables)
    }
    
    private func loadAlbums(searchTerm: String) {
        self.albums.removeAll()
        self.dataModel.reset()
        self.dataModel.networkCall(searchTerm: searchTerm) { albums in
            albums.forEach { album in
                self.appendAlbum(album: album)
            }
        }
    }
    
    private func appendAlbum(album: Album) {
        let albumViewModel = AlbumViewModel(album: album)
        DispatchQueue.main.async {
            self.albums.append(albumViewModel)
        }
        
        self.dataModel.networkCall(forAlbum: album) { image in
            DispatchQueue.main.async {
                albumViewModel.artwork = image
            }
        }
    }
}

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
