//
//  DiscoverView.swift
//  Vinyl
//
//  Created by Thomas Gray on 08/06/2022.
//

import SwiftUI

struct DiscoverView: View {
    
    @ObservedObject var viewModel: AlbumListViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                if self.viewModel.albums.isEmpty {
                    Text("Nothing to show...")
                } else {
                    List(self.viewModel.albums) { album in
                        AlbumView(album: album)
                    }
                    .listStyle(PlainListStyle())
                }
            }
        }
        .searchable(text: self.$viewModel.searchTerm, prompt: "Search music")
    }
}
