//
//  LocationsViewModel.swift
//  MapApp-SwiftUI
//
//  Created by Adi Amoyal on 27/12/2024.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject {
    
    @Published var locations: [Location]    // All loaded locations
    @Published var mapLocation: Location {  // Current location on map
        didSet {
            updateMapRegion(locaion: mapLocation)
        }
    }
    
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    @Published var showLocationsList: Bool = false
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.updateMapRegion(locaion: locations.first!)
    }
    
    private func updateMapRegion(locaion: Location) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(
                center: locaion.coordinates,
                span: mapSpan)
        }
    }
    
    func toggleLocationsList() {
        withAnimation(.easeInOut) {
            showLocationsList = !showLocationsList
        }
    }
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationsList = false
        }
    }
}
