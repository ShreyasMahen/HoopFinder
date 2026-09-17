//
//  ContentView.swift
//  Hoopfinder
//
//  Created by Shreyas Mahendra on 3/23/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            TeamListView()
                .tabItem {
                    Label("Teams", systemImage: "list.bullet")
                }

            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "star.fill")
                }
        }
    }
}
#Preview {
    ContentView()
}
