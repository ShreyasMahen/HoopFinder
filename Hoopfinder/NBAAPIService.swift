//
//  NBAAPIService.swift
//  Hoopfinder
//
//  Created by Shreyas Mahendra on 3/23/26.
//
import Foundation

final class NBAAPIService {

    // used by TeamViewModel
    func fetchTeams() async -> [Team] {
        return allTeams
    }

    // used by FavoritesView
    func fetchLocalTeams() -> [Team] {
        return allTeams
    }

    // full 30 teams
    private var allTeams: [Team] {
        [
            // EAST
            Team(id: 1, fullName: "Boston Celtics", city: "Boston", conference: "East", division: "Atlantic"),
            Team(id: 2, fullName: "Brooklyn Nets", city: "Brooklyn", conference: "East", division: "Atlantic"),
            Team(id: 3, fullName: "New York Knicks", city: "New York", conference: "East", division: "Atlantic"),
            Team(id: 4, fullName: "Philadelphia 76ers", city: "Philadelphia", conference: "East", division: "Atlantic"),
            Team(id: 5, fullName: "Toronto Raptors", city: "Toronto", conference: "East", division: "Atlantic"),

            Team(id: 6, fullName: "Chicago Bulls", city: "Chicago", conference: "East", division: "Central"),
            Team(id: 7, fullName: "Cleveland Cavaliers", city: "Cleveland", conference: "East", division: "Central"),
            Team(id: 8, fullName: "Detroit Pistons", city: "Detroit", conference: "East", division: "Central"),
            Team(id: 9, fullName: "Indiana Pacers", city: "Indiana", conference: "East", division: "Central"),
            Team(id: 10, fullName: "Milwaukee Bucks", city: "Milwaukee", conference: "East", division: "Central"),

            Team(id: 11, fullName: "Atlanta Hawks", city: "Atlanta", conference: "East", division: "Southeast"),
            Team(id: 12, fullName: "Charlotte Hornets", city: "Charlotte", conference: "East", division: "Southeast"),
            Team(id: 13, fullName: "Miami Heat", city: "Miami", conference: "East", division: "Southeast"),
            Team(id: 14, fullName: "Orlando Magic", city: "Orlando", conference: "East", division: "Southeast"),
            Team(id: 15, fullName: "Washington Wizards", city: "Washington", conference: "East", division: "Southeast"),

            // WEST
            Team(id: 16, fullName: "Denver Nuggets", city: "Denver", conference: "West", division: "Northwest"),
            Team(id: 17, fullName: "Minnesota Timberwolves", city: "Minnesota", conference: "West", division: "Northwest"),
            Team(id: 18, fullName: "Oklahoma City Thunder", city: "Oklahoma City", conference: "West", division: "Northwest"),
            Team(id: 19, fullName: "Portland Trail Blazers", city: "Portland", conference: "West", division: "Northwest"),
            Team(id: 20, fullName: "Utah Jazz", city: "Utah", conference: "West", division: "Northwest"),

            Team(id: 21, fullName: "Golden State Warriors", city: "San Francisco", conference: "West", division: "Pacific"),
            Team(id: 22, fullName: "Los Angeles Clippers", city: "Los Angeles", conference: "West", division: "Pacific"),
            Team(id: 23, fullName: "Los Angeles Lakers", city: "Los Angeles", conference: "West", division: "Pacific"),
            Team(id: 24, fullName: "Phoenix Suns", city: "Phoenix", conference: "West", division: "Pacific"),
            Team(id: 25, fullName: "Sacramento Kings", city: "Sacramento", conference: "West", division: "Pacific"),

            Team(id: 26, fullName: "Dallas Mavericks", city: "Dallas", conference: "West", division: "Southwest"),
            Team(id: 27, fullName: "Houston Rockets", city: "Houston", conference: "West", division: "Southwest"),
            Team(id: 28, fullName: "Memphis Grizzlies", city: "Memphis", conference: "West", division: "Southwest"),
            Team(id: 29, fullName: "New Orleans Pelicans", city: "New Orleans", conference: "West", division: "Southwest"),
            Team(id: 30, fullName: "San Antonio Spurs", city: "San Antonio", conference: "West", division: "Southwest")
        ]
    }
}
