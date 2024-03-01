//
//  LoadingView.swift
//  IOS_SUPERPODERES_PRACTICA
//
//  Created by Daniel Serrano on 26/2/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .scaleEffect(2)
                .padding()
            Text("Loading...")
                .font(.headline)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
