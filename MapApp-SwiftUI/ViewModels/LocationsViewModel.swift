//
//  LocationsViewModel.swift
//  MapApp-SwiftUI
//
//  Created by Adi Amoyal on 31/10/2023.
//

import Foundation

class LocationsViewModel: ObservableObject {
    
    @Published var locations: [Location]
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
    }
    
}
