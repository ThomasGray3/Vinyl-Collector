//
//  ContentView.swift
//  Vinyl
//
//  Created by Thomas Gray on 26/05/2022.
//

import SwiftUI
import MusicKit

struct ContentView: View {
    
    @State private var searchTerm = ""
    @State private var showingSheet = true
    
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
        .sheet(isPresented: self.$showingSheet) {
            Onboarding()
        }
    }
}
