//
//  RpnCalcView.swift
//  RpnCalculator
//
//  Created by Robin Roelandt on 09/10/2025.
//

import SwiftUI

struct RpnCalcView: View {
    @State var calcEngine = CalcEngine()
    @State private var currentInput: String = ""
    @State private var displayedText: String = ""

    var body: some View {
        VStack {
            Spacer()
            
            HStack() {
                VStack(spacing: 5) {
                    Text(displayedText)
                        .frame(width: 160, height: 285)
                        .padding()
                        .border(Color.black)

                    CalculatorButton(title: "Show Stack") {
                        displayedText.append("\n" + printedStack)
                    }
                }

                VStack() {
                    Grid(horizontalSpacing: 2, verticalSpacing: 2) {
                        GridRow {
                            CalculatorButton(title: "7") { appendDigit("7") }
                            CalculatorButton(title: "8") { appendDigit("8") }
                            CalculatorButton(title: "9") { appendDigit("9") }
                            CalculatorButton(title: "/") {
                                calcEngine.divide()
                                updateDisplay()
                            }
                        }
                        GridRow {
                            CalculatorButton(title: "4") { appendDigit("4") }
                            CalculatorButton(title: "5") { appendDigit("5") }
                            CalculatorButton(title: "6") { appendDigit("6") }
                            CalculatorButton(title: "*") {
                                calcEngine.multiply()
                                updateDisplay()
                            }
                        }
                        GridRow {
                            CalculatorButton(title: "1") { appendDigit("1") }
                            CalculatorButton(title: "2") { appendDigit("2") }
                            CalculatorButton(title: "3") { appendDigit("3") }
                            CalculatorButton(title: "-") {
                                calcEngine.subtract()
                                updateDisplay()
                            }
                        }
                        GridRow {
                            CalculatorButton(title: "0") { appendDigit("0") }
                            CalculatorButton(title: "") {}
                            CalculatorButton(title: "") {}
                            CalculatorButton(title: "+") {
                                calcEngine.add()
                                updateDisplay()
                            }
                        }
                        GridRow {
                            CalculatorButton(title: "CLEAR") {
                                currentInput = ""
                                calcEngine.clear()
                                updateDisplay()
                            }
                            .gridCellColumns(2)
                            CalculatorButton(title: "ENTER") {
                                pushInput()
                            }.gridCellColumns(2)
                        }
                    }
                }
                
            }
            .padding()
            
            Spacer()
        }
        
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
        displayedText = (calcEngine.stack.reversed().map { "\($0)" } + [currentInput]).filter { !$0.isEmpty }.joined(separator: "\n")
    }

    var printedStack: String {
        "[" + calcEngine.stack.reversed().map { "\($0)" }.joined(separator: ", ") + "]"
    }

}

#Preview {
    RpnCalcView()
}

