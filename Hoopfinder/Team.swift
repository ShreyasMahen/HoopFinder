//
//  Team.swift
//  Hoopfinder
//
//  Created by Shreyas Mahendra on 3/23/26.
//
import Foundation

struct Team: Identifiable, Codable, Hashable {
    let id: Int
    let fullName: String
    let city: String
    let conference: String
    let division: String

    enum CodingKeys: String, CodingKey {
        case id
        case fullName = "full_name"
        case city
        case conference
        case division
    }
}
