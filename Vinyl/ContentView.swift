//
//  ContentView.swift
//  Vinyl
//
//  Created by Thomas Gray on 26/05/2022.
//

import SwiftUI
import MusicKit

struct ContentView: View {
    
    let vinylCoreData: CoreDataManager
    
    var body: some View {
        TabView {
            DiscoverView(viewModel: AlbumListViewModel())
                .tabItem {
                    Label("Discover", systemImage: "music.note.house")
                }
            CollectionView(vinylCoreData: CoreDataManager())
                .tabItem {
                    Label("Collection", systemImage: "record.circle")
                }
        }
    }
}
