//
//  HomeView.swift
//  Hoopfinder
//
//  Created by Shreyas Mahendra on 3/23/26.
//
import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 25) {
                Text("HoopFinder")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("Find courts, explore NBA teams, and save favorites.")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)

                NavigationLink {
                    MapView()
                } label: {
                    Label("Find Nearby Courts", systemImage: "map")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)

                NavigationLink {
                    TeamListView()
                } label: {
                    Label("Browse NBA Teams", systemImage: "list.bullet")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)

                NavigationLink {
                    StandingsView()
                } label: {
                    Label("View Standings", systemImage: "chart.bar")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)

                NavigationLink {
                    FavoritesView()
                } label: {
                    Label("View Favorites", systemImage: "star.fill")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)

                Spacer()
            }
            .padding()
            .navigationTitle("Home")
        }
    }
}
