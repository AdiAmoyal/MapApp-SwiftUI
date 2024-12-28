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
    
    @Published var showLocationsList: Bool = false  // Show list of locations
    @Published var sheetLocation: Location? = nil   // Show location detail via sheet
    
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
    
    func nextButtonPressed() {
        guard let currentIndex = locations.firstIndex(where: { $0 == mapLocation}) else {
            print("Could not find current index in locations array! Should never happen.")
            return
        }
        let nextIndex = currentIndex + 1
        
        guard locations.indices.contains(nextIndex) else {
            guard let firstLocation = locations.first else { return }
            showNextLocation(location: firstLocation)
            return
        }
        
        // Next index is valid
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
    }
}
