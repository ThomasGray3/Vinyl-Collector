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
    @Binding var musicAuthorizationStatus: MusicAuthorization.Status
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.mint, .indigo]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack {
                switch self.musicAuthorizationStatus {
                case .restricted:
                    Text("Music Albums cannot be accessed on this iPhone because usage of ") + Text(Image(systemName: "applelogo"))
                    + Text(" Music is restricted.")
                default:
                    Text("Vinyl uses ") + Text(Image(systemName: "applelogo")) + Text(" Music")
                }
                Button {
                    self.dismiss()
                } label: {
                    Text("Get started")
                        .padding(.horizontal, 50)
                        .padding(.vertical, 10)
                        .background(Color.white).opacity(0.8)
                        .clipShape(Capsule())
                }
            }
        }
    }
}
