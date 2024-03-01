//
//  ErrorView.swift
//  IOS_SUPERPODERES_PRACTICA
//
//  Created by Daniel Serrano on 26/2/24.
//

import SwiftUI

struct ErrorView: View {
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.triangle")
                .font(.system(size: 60))
                .foregroundColor(.red)
                .padding()
            Text("Error en la carga")
                .font(.headline)
                .multilineTextAlignment(.center)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
