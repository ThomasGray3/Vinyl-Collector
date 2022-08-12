//
//  VinylApp.swift
//  Vinyl
//
//  Created by Thomas Gray on 26/05/2022.
//

import SwiftUI

@main
struct VinylApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(vinylCoreData: CoreDataManager())
        }
    }
}
