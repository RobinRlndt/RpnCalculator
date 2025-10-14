//
//  File.swift
//  RpnCalculator
//
//  Created by Robin Roelandt on 09/10/2025.
//

import Foundation
import Observation

@Observable
class CalcEngine {
    var stack: [Double] = []
    
    func push(_ value: Double) {
        stack.append(value)
    }

    func clear() {
        stack.removeAll()
    }
    
    func add() {
        bewerking { $0 + $1 }
    }

    func subtract() {
        bewerking { $0 - $1 }
    }

    func multiply() {
        bewerking { $0 * $1 }
    }

    func divide() {
        bewerking { $0 / $1 }
    }

    private func bewerking(_ operation: (Double, Double) -> Double) {
        guard stack.count >= 2 else { return }
        let rhs = stack.removeLast()
        let lhs = stack.removeLast()
        let result = operation(lhs, rhs)
        stack.append(result)
    }
}
