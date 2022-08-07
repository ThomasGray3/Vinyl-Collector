//
//  AlbumView.swift
//  Vinyl
//
//  Created by Thomas Gray on 07/08/2022.
//

import SwiftUI

struct AlbumView: View {
    
    @ObservedObject var album: AlbumViewModel
    var body: some View {
        HStack {
            ArtworkView(image: self.album.artwork)
                .padding(.trailing)
            VStack {
                Text(self.album.albumName)
                Text(self.album.artistName)
                    .font(.footnote)
            }
        }
        .padding()
    }
}
