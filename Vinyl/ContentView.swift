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
    @State private var musicSubscription: MusicSubscription?
    @State private var musicAuthorization: Bool = true
    @StateObject private var authorizationManager = AuthorizationManager.shared
    
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
            Onboarding(musicAuthorizationStatus: $authorizationManager.musicAuthorizationStatus)
                .interactiveDismissDisabled()
        }
    }
    
   /* func checkStatus() async {
        let authStatus = await MusicAuthorization.request()
        
        switch authStatus {
        case .authorized:
            self.musicAuthorization = true
        case .denied:
            print("denied")
        case .notDetermined:
            print("not determined")
        case .restricted:
            print("restricted")
        @unknown default:
            print("error")
        }
    }
    
    func checkSubscription() {
        let canPlayCatalogContent = musicSubscription?.canPlayCatalogContent ?? false
        let canBecomeSubscriber = musicSubscription?.canBecomeSubscriber ?? false
        print(canPlayCatalogContent)
        print(canBecomeSubscriber)
    } */
}
