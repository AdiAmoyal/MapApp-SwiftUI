//
//  LocationsView.swift
//  MapApp-SwiftUI
//
//  Created by Adi Amoyal on 27/12/2024.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    @EnvironmentObject private var viewModel: LocationsViewModel
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $viewModel.mapRegion)
                .ignoresSafeArea()
            
            VStack {
                header
                    .padding()
                
                Spacer()
            }
        }
    }
}

extension LocationsView {
    
    private var header: some View {
        VStack(spacing: 0) {
            Button(action: viewModel.toggleLocationsList) {
                Text(viewModel.mapLocation.name + " ," + viewModel.mapLocation.cityName)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundStyle(.primary)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: viewModel.mapLocation)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundStyle(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: viewModel.showLocationsList ? 180 : 0))
                    }
            }
            .accentColor(.primary)
            
            if viewModel.showLocationsList {
                LocationsListView()
            }
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(
            color: Color.black.opacity(0.3),
            radius: 20,
            x: 0,
            y: 15)
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}
