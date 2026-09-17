//
//  TeamViewModel.swift
//  Hoopfinder
//
//  Created by Shreyas Mahendra on 3/23/26.
//
import Foundation
import Combine

@MainActor
final class TeamViewModel: ObservableObject {
    @Published var teams: [Team] = []
    @Published var isLoading = false

    private let service = NBAAPIService()

    func loadTeams() async {
        isLoading = true
        teams = (try? await service.fetchTeams()) ?? []
        isLoading = false
    }
}
