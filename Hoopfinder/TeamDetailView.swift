//
//  TeamDetailView.swift
//  Hoopfinder
//
//  Created by Shreyas Mahendra on 3/23/26.
//
import SwiftUI
import SwiftData

struct TeamDetailView: View {
    let team: Team
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(team.fullName)
                .font(.largeTitle)
                .fontWeight(.bold)

            VStack(alignment: .leading, spacing: 8) {
                Text("City: \(team.city)")
                Text("Conference: \(team.conference)")
                Text("Division: \(team.division)")
            }
            .foregroundStyle(.secondary)

            Button {
                let favorite = FavoriteItem(title: team.fullName, type: "Team")
                modelContext.insert(favorite)
                try? modelContext.save()
            } label: {
                Label("Save to Favorites", systemImage: "star.fill")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)

            Spacer()
        }
        .padding()
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        TeamDetailView(
            team: Team(
                id: 1,
                fullName: "Phoenix Suns",
                city: "Phoenix",
                conference: "West",
                division: "Pacific"
            )
        )
    }
}
