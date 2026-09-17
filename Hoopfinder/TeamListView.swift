//
//  TeamListView.swift
//  Hoopfinder
//
//  Created by Shreyas Mahendra on 3/23/26.
//
import SwiftUI

struct TeamListView: View {
    @StateObject private var viewModel = TeamViewModel()

    var body: some View {
        NavigationStack {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading teams...")
                } else {
                    List(viewModel.teams) { team in
                        NavigationLink {
                            TeamDetailView(team: team)
                        } label: {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(team.fullName)
                                    .font(.headline)

                                Text("\(team.city) • \(team.conference)")
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
            }
            .navigationTitle("NBA Teams")
            .task {
                await viewModel.loadTeams()
            }
        }
    }
}

#Preview {
    TeamListView()
}

