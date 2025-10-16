import Foundation
import Observation

@Observable
class CalcEngine {
    var stack: [Double] = []
    var displayMessage: String = ""

    func push(_ value: Double) {
        stack.append(value)
        displayMessage = ""
    }

    func clear() {
        stack.removeAll()
        displayMessage = ""
    }

    func add() {
        performOperation { $0 + $1 }
    }

    func subtract() {
        performOperation { $0 - $1 }
    }

    func multiply() {
        performOperation { $0 * $1 }
    }

    func divide() {
        performOperation { $0 / $1 }
    }

    private func performOperation(_ operation: (Double, Double) -> Double) {
        guard stack.count >= 2 else {
            displayMessage = "Not enough operands"
            return
        }
        let rhs = stack.removeLast()
        let lhs = stack.removeLast()
        let result = operation(lhs, rhs)
        stack.append(result)
        displayMessage = ""
    }
}



