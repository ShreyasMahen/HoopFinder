//
//  StandingsView.swift
//  Hoopfinder
//
//  Created by Shreyas Mahendra on 4/19/26.
//


import SwiftUI

struct StandingsView: View {
    struct StandingTeam: Identifiable {
        let id = UUID()
        let rank: Int
        let name: String
        let record: String
    }

    private let eastTeams: [StandingTeam] = [
        .init(rank: 1, name: "Detroit Pistons", record: "60-22"),
        .init(rank: 2, name: "Boston Celtics", record: "56-26"),
        .init(rank: 3, name: "New York Knicks", record: "53-29"),
        .init(rank: 4, name: "Cleveland Cavaliers", record: "52-30"),
        .init(rank: 5, name: "Toronto Raptors", record: "46-36"),
        .init(rank: 6, name: "Atlanta Hawks", record: "46-36"),
        .init(rank: 7, name: "Philadelphia 76ers", record: "45-37"),
        .init(rank: 8, name: "Orlando Magic", record: "45-37"),
        .init(rank: 9, name: "Charlotte Hornets", record: "44-38"),
        .init(rank: 10, name: "Miami Heat", record: "43-39"),
        .init(rank: 11, name: "Milwaukee Bucks", record: "32-50"),
        .init(rank: 12, name: "Chicago Bulls", record: "31-51"),
        .init(rank: 13, name: "Brooklyn Nets", record: "20-62"),
        .init(rank: 14, name: "Indiana Pacers", record: "19-63"),
        .init(rank: 15, name: "Washington Wizards", record: "19-63")
    ]

    private let westTeams: [StandingTeam] = [
        .init(rank: 1, name: "Oklahoma City Thunder", record: "64-18"),
        .init(rank: 2, name: "San Antonio Spurs", record: "62-20"),
        .init(rank: 3, name: "Denver Nuggets", record: "54-28"),
        .init(rank: 4, name: "Los Angeles Lakers", record: "53-29"),
        .init(rank: 5, name: "Houston Rockets", record: "52-30"),
        .init(rank: 6, name: "Minnesota Timberwolves", record: "49-33"),
        .init(rank: 7, name: "Phoenix Suns", record: "45-37"),
        .init(rank: 8, name: "Portland Trail Blazers", record: "42-40"),
        .init(rank: 9, name: "Los Angeles Clippers", record: "42-40"),
        .init(rank: 10, name: "Golden State Warriors", record: "37-45"),
        .init(rank: 11, name: "New Orleans Pelicans", record: "26-56"),
        .init(rank: 12, name: "Dallas Mavericks", record: "26-56"),
        .init(rank: 13, name: "Memphis Grizzlies", record: "25-57"),
        .init(rank: 14, name: "Sacramento Kings", record: "22-60"),
        .init(rank: 15, name: "Utah Jazz", record: "22-60")
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    Text("2025-26 NBA Standings")
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    Text("Regular Season")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)

                    standingsSection(title: "Eastern Conference", teams: eastTeams)
                    standingsSection(title: "Western Conference", teams: westTeams)
                }
                .padding()
            }
            .navigationTitle("Standings")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    @ViewBuilder
    private func standingsSection(title: String, teams: [StandingTeam]) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)

            VStack(spacing: 0) {
                HStack {
                    Text("#")
                        .frame(width: 36, alignment: .leading)
                    Text("Team")
                    Spacer()
                    Text("Record")
                }
                .font(.headline)
                .padding()
                .background(Color.blue.opacity(0.12))

                ForEach(teams) { team in
                    HStack {
                        Text("\(team.rank)")
                            .frame(width: 36, alignment: .leading)
                            .fontWeight(.semibold)

                        Text(team.name)

                        Spacer()

                        Text(team.record)
                            .foregroundStyle(.secondary)
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 10)

                    if team.id != teams.last?.id {
                        Divider()
                    }
                }
            }
            .background(Color(.systemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.gray.opacity(0.2), lineWidth: 1)
            )
        }
    }
}

#Preview {
    StandingsView()
}
