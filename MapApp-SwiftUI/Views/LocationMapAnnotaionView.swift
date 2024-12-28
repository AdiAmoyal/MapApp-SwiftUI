//
//  LocationMapAnnotaionView.swift
//  MapApp-SwiftUI
//
//  Created by Adi Amoyal on 27/12/2024.
//

import SwiftUI

struct LocationMapAnnotaionView: View {
    
    let accentColor = Color("AccentColor")
    
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .font(.headline)
                .foregroundStyle(Color.white)
                .padding(6)
                .background(accentColor)
                .cornerRadius(30)
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundStyle(accentColor)
                .frame(width: 10, height: 10)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -3)
                .padding(.bottom, 40)
        }
    }
}

#Preview {
    LocationMapAnnotaionView()
}
