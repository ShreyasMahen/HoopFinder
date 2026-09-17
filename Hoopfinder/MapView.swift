//
//  MapView.swift
//  Hoopfinder
//
//  Created by Shreyas Mahendra on 4/19/26.
//
import SwiftUI
import MapKit
import SwiftData

struct MapView: View {
    @StateObject private var locationManager = LocationManager()
    @Environment(\.modelContext) private var modelContext

    @State private var cameraPosition: MapCameraPosition = .automatic
    @State private var courts: [MKMapItem] = []
    @State private var selectedCourtName: String = ""

    var body: some View {
        NavigationStack {
            VStack(spacing: 12) {

                Map(position: $cameraPosition) {

                    // USER LOCATION
                    if let userLocation = locationManager.location {
                        Marker("You", coordinate: userLocation.coordinate)
                    }

                    // CLICKABLE COURTS
                    ForEach(courts, id: \.self) { item in
                        Annotation(item.name ?? "Court", coordinate: item.placemark.coordinate) {

                            Button {
                                selectedCourtName = item.name ?? "Court"
                            } label: {
                                Image(systemName: "basketball.fill")
                                    .foregroundColor(.orange)
                                    .padding(6)
                                    .background(Color.white)
                                    .clipShape(Circle())
                            }

                        }
                    }
                }
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 14))
                .padding(.horizontal)

                HStack {
                    Button("Find Nearby Courts") {
                        searchCourts()
                    }
                    .buttonStyle(.borderedProminent)

                    Button("Center on Me") {
                        centerOnUser()
                    }
                    .buttonStyle(.bordered)
                }

                // SELECTED COURT DISPLAY
                if !selectedCourtName.isEmpty {
                    Text(selectedCourtName)
                        .font(.headline)

                    Button("Save This Court") {
                        let favorite = FavoriteItem(
                            title: selectedCourtName,
                            type: "Court"
                        )
                        modelContext.insert(favorite)
                        try? modelContext.save()
                    }
                    .buttonStyle(.bordered)
                }

                Spacer()
            }
            .navigationTitle("Nearby Courts")
            .onAppear {
                centerOnUser()
            }
        }
    }

    // CENTER ON USER OR TEMPE
    private func centerOnUser() {
        if let userLocation = locationManager.location {
            cameraPosition = .region(
                MKCoordinateRegion(
                    center: userLocation.coordinate,
                    span: MKCoordinateSpan(latitudeDelta: 0.04, longitudeDelta: 0.04)
                )
            )
        } else {
            cameraPosition = .region(
                MKCoordinateRegion(
                    center: CLLocationCoordinate2D(latitude: 33.4255, longitude: -111.9400),
                    span: MKCoordinateSpan(latitudeDelta: 0.04, longitudeDelta: 0.04)
                )
            )
        }

        searchCourts()
    }

    // SEARCH COURTS
    private func searchCourts() {
        let center = locationManager.location?.coordinate ??
            CLLocationCoordinate2D(latitude: 33.4255, longitude: -111.9400)

        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = "basketball court"
        request.region = MKCoordinateRegion(
            center: center,
            span: MKCoordinateSpan(latitudeDelta: 0.08, longitudeDelta: 0.08)
        )

        Task {
            if let response = try? await MKLocalSearch(request: request).start() {
                let items = response.mapItems

                await MainActor.run {
                    courts = items

                    if let first = items.first {
                        selectedCourtName = first.name ?? "Court"
                    }
                }
            }
        }
    }
}

#Preview {
    MapView()
}
