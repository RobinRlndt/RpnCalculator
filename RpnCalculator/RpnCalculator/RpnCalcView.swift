import SwiftUI

struct RpnCalcView: View {
    @State var calcEngine = CalcEngine()
    @State private var currentInput: String = ""
    @State private var displayedText: String = ""

    var body: some View {
        VStack {
            Spacer()

            Text(displayedText)
                .frame(width: 160, height: 285)
                .padding()
                .border(Color.black)

            CalculatorButton(title: "Show Stack") {
                displayedText = printedStack
            }
            .padding(.bottom, 10)

            VStack(spacing: 8) {
                HStack(spacing: 8) {
                    CalculatorButton(title: "7") { appendDigit("7") }
                    CalculatorButton(title: "8") { appendDigit("8") }
                    CalculatorButton(title: "9") { appendDigit("9") }
                    CalculatorButton(title: "/") {
                        calcEngine.divide()
                        updateDisplay()
                    }
                }
                HStack(spacing: 8) {
                    CalculatorButton(title: "4") { appendDigit("4") }
                    CalculatorButton(title: "5") { appendDigit("5") }
                    CalculatorButton(title: "6") { appendDigit("6") }
                    CalculatorButton(title: "*") {
                        calcEngine.multiply()
                        updateDisplay()
                    }
                }
                HStack(spacing: 8) {
                    CalculatorButton(title: "1") { appendDigit("1") }
                    CalculatorButton(title: "2") { appendDigit("2") }
                    CalculatorButton(title: "3") { appendDigit("3") }
                    CalculatorButton(title: "-") {
                        calcEngine.subtract()
                        updateDisplay()
                    }
                }
                HStack(spacing: 8) {
                    CalculatorButton(title: "0") { appendDigit("0") }
                    CalculatorButton(title: "CLEAR") {
                        currentInput = ""
                        calcEngine.clear()
                        updateDisplay()
                    }
                    CalculatorButton(title: "ENTER") {
                        pushInput()
                    }
                    CalculatorButton(title: "+") {
                        calcEngine.add()
                        updateDisplay()
                    }
                }
            }
            .padding()

            Spacer()
        }
        .padding()
        .onAppear(perform: updateDisplay)
    }

    func appendDigit(_ digit: String) {
        currentInput.append(digit)
        updateDisplay()
    }

    func pushInput() {
        if let number = Double(currentInput) {
            calcEngine.push(number)
            currentInput = ""
            updateDisplay()
        }
    }

    func updateDisplay() {
        if !calcEngine.displayMessage.isEmpty {
            displayedText = calcEngine.displayMessage
        } else {
            let stackText = calcEngine.stack.map { "\($0)" }.joined(separator: "\n")
            displayedText = (stackText.isEmpty ? "" : stackText + "\n") + currentInput
        }
    }

    var printedStack: String {
        "[" + calcEngine.stack.map { "\($0)" }.joined(separator: ", ") + "]"
    }
}

#Preview {
    RpnCalcView()
}
