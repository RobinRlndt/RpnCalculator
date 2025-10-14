//
//  CalculatorButton.swift
//  RpnCalculator
//
//  Created by Robin Roelandt on 14/10/2025.
//

import SwiftUI

struct CalculatorButton: View {
    var title: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundColor(.white)
                .font(.title)
                .background(Color.blue)
                .cornerRadius(10)
        }
        .frame(height: 70)
        .padding(4)
    }
}


