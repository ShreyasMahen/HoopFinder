//
//  HoopfinderApp.swift
//  Hoopfinder
//
//  Created by Shreyas Mahendra on 3/23/26.
//

import SwiftUI
import SwiftData

@main
struct HoopFinderApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: FavoriteItem.self)
    }
}
