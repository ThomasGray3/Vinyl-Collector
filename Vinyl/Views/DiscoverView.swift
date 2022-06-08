//
//  DiscoverView.swift
//  Vinyl
//
//  Created by Thomas Gray on 08/06/2022.
//

import SwiftUI

struct DiscoverView: View {
    
    @State private var searchTerm = ""
    
    var body: some View {
        NavigationView {
            List {
                Text("Hello World")
                Text("Hello World")
                Text("Hello World")
            }
            .navigationTitle("Yinyl")
        }
        .searchable(text: self.$searchTerm, prompt: "Search music")
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
