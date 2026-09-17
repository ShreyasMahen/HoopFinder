//
//  FavoritesView.swift
//  Hoopfinder
//
//  Created by Shreyas Mahendra on 3/23/26.
//
import SwiftUI
import SwiftData

struct FavoritesView: View {
    @Query(sort: \FavoriteItem.title) private var favorites: [FavoriteItem]
    @Environment(\.modelContext) private var modelContext

    // full team list
    let allTeams = NBAAPIService().fetchLocalTeams()

    var body: some View {
        NavigationStack {
            List {
                ForEach(favorites) { item in

                    if item.type == "Team",
                       let team = allTeams.first(where: { $0.fullName == item.title }) {

                        NavigationLink {
                            TeamDetailView(team: team)
                        } label: {
                            rowView(item)
                        }

                    } else {
                        rowView(item)
                    }

                }
                .onDelete { indexSet in
                    for index in indexSet {
                        modelContext.delete(favorites[index])
                    }
                }
            }
            .navigationTitle("Favorites")
            .toolbar {
                EditButton()
            }
        }
    }

    func rowView(_ item: FavoriteItem) -> some View {
        HStack {
            Image(systemName: item.type == "Court" ? "map" : "sportscourt")
                .foregroundStyle(.blue)

            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.headline)

                Text(item.type)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    FavoritesView()
        .modelContainer(for: FavoriteItem.self, inMemory: true)
}
