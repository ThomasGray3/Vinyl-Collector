//
//  CollectionView.swift
//  Vinyl
//
//  Created by Thomas Gray on 08/06/2022.
//

import SwiftUI

struct CollectionView: View {
    
    let vinylCoreData: CoreDataManager
    @ObservedObject var viewModel: CollectionViewModel
    
    var body: some View {
        List(self.viewModel.savedAlbums) { album in
            AlbumView(album: album)
        }
    }
}
