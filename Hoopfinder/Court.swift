//
//  Court.swift
//  Hoopfinder
//
//  Created by Shreyas Mahendra on 3/23/26.
//
import Foundation
import CoreLocation

struct Court: Identifiable, Codable, Hashable {
    let id: UUID
    let name: String
    let latitude: Double
    let longitude: Double
    let distanceText: String

    init(id: UUID = UUID(), name: String, latitude: Double, longitude: Double, distanceText: String) {
        self.id = id
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.distanceText = distanceText
    }

    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

