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
                .font(.title2)
                .foregroundColor(.white)
                .padding()
                .frame(minWidth: 60, minHeight: 60)
                .background(Color.blue)
                .cornerRadius(10)
        }
        .buttonStyle(.plain)
    }
}





