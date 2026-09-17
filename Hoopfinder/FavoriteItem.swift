//
//  FavoriteItem.swift
//  Hoopfinder
//
//  Created by Shreyas Mahendra on 3/23/26.
//
import Foundation
import SwiftData

@Model
final class FavoriteItem {
    var id: UUID
    var title: String
    var type: String

    init(id: UUID = UUID(), title: String, type: String) {
        self.id = id
        self.title = title
        self.type = type
    }
}

