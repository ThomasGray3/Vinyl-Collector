//
//  DiscoverViewModel.swift
//  Vinyl
//
//  Created by Thomas Gray on 12/08/2022.
//
import Foundation
import SwiftUI
import Combine

class DiscoverViewModel: ObservableObject {
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

