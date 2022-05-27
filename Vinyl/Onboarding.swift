//
//  Onboarding.swift
//  Vinyl
//
//  Created by Thomas Gray on 26/05/2022.
//

import SwiftUI
import MusicKit

struct Onboarding: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var musicSubscription: MusicSubscription?
    @State private var musicAuthorization: Bool = false
    
    var body: some View {
        VStack {
            Text("Onbording here...")
                .task {
                    await self.checkStatus()
                    for await subscription in MusicSubscription.subscriptionUpdates {
                        self.musicSubscription = subscription
                        self.checkSubscription()
                    }
                   
                }
                .onChange(of: self.musicAuthorization) { value in
                    guard value else { return }
                    self.dismiss()
                }
        }
    }
    
    func checkStatus() async {
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
    }
}
