//
//  CollectionViewModel.swift
//  Vinyl
//
//  Created by Thomas Gray on 12/08/2022.
//

import Foundation
import SwiftUI
import Combine

class CollectionViewModel: ObservableObject {
    
    @State var savedAlbums: [AlbumViewModel] = []
    
    init() {
        self.getSavedAlbums
    }
    
    func getSavedAlbums() {
        let savedAlbumItems = self.vinylCoreData.getAlbums()
    }
}
