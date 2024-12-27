//
//  MapApp_SwiftUIApp.swift
//  MapApp-SwiftUI
//
//  Created by Adi Amoyal on 27/12/2024.
//

import SwiftUI

@main
struct MapApp_SwiftUIApp: App {
    
    @StateObject private var viewModel = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(viewModel)
        }
    }
}
