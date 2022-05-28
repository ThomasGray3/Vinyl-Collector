//
//  AuthorizationManager.swift
//  Vinyl
//
//  Created by Thomas Gray on 29/05/2022.
//

import Foundation
import MusicKit

class AuthorizationManager: ObservableObject {
    
    static let shared = AuthorizationManager()
    @Published var isWelcomeViewPresented: Bool
    @Published var musicAuthorizationStatus: MusicAuthorization.Status {
        didSet {
            self.isWelcomeViewPresented = (self.musicAuthorizationStatus != .authorized)
        }
    }
    
    private init() {
        let authorizationStatus = MusicAuthorization.currentStatus
        self.musicAuthorizationStatus = authorizationStatus
        self.isWelcomeViewPresented = (authorizationStatus != .authorized)
    }
}
