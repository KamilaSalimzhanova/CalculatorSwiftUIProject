//
//  CalculatorButtonsView.swift
//  CalculatorSwiftUIProject
//
//  Created by kamila on 21.03.2025.
//

import SwiftUI

struct CalculatorButtonsView: View {
    @Binding var mainResult: String
    @Binding var currentComputation: String
    let buttonData: [RowofCalcButtonsModel] = [
        RowofCalcButtonsModel(row: [
            CalcButtonModel(
                calcButton: .clear,
                color: topButtonsColor),
            CalcButtonModel(
                calcButton: .negative,
                color: topButtonsColor),
            CalcButtonModel(
                calcButton: .percent,
                color: topButtonsColor),
            CalcButtonModel(
                calcButton: .divide,
                color: rightButtonsColor)]),
        RowofCalcButtonsModel(row: [
            CalcButtonModel(
                calcButton: .seven,
                color: digitsColor),
            CalcButtonModel(
                calcButton: .eight,
                color: digitsColor),
            CalcButtonModel(
                calcButton: .nine,
                color: digitsColor),
            CalcButtonModel(
                calcButton: .multiply,
                color: rightButtonsColor)]),
        RowofCalcButtonsModel(row: [
            CalcButtonModel(
                calcButton: .four,
                color: digitsColor),
            CalcButtonModel(
                calcButton: .five,
                color: digitsColor),
            CalcButtonModel(
                calcButton: .six,
                color: digitsColor),
            CalcButtonModel(
                calcButton: .subtract,
                color: rightButtonsColor)]),
        RowofCalcButtonsModel(row: [
            CalcButtonModel(
                calcButton: .one,
                color: digitsColor),
            CalcButtonModel(
                calcButton: .two,
                color: digitsColor),
            CalcButtonModel(
                calcButton: .three,
                color: digitsColor),
            CalcButtonModel(
                calcButton: .add,
                color: rightButtonsColor)]),
        RowofCalcButtonsModel(row: [
            CalcButtonModel(
                calcButton: .undo,
                color: digitsColor),
            CalcButtonModel(
                calcButton: .zero,
                color: digitsColor),
            CalcButtonModel(
                calcButton: .decimal,
                color: digitsColor),
            CalcButtonModel(
                calcButton: .equal,
                color: digitsColor)])]
    var body: some View {
        Grid {
            ForEach(buttonData) {rowofCalcButtonsModel in
                GridRow {
                    ForEach(rowofCalcButtonsModel.row) { calcButton in
                        Button {
                            buttonPressed(calcButton: calcButton.calcButton)
                        } label: {
                            ButtonView(calcButton: calcButton.calcButton, fgcolor: calcButton.color, bgcolor: buttonBackgroundColor)
                        }
                        
                    }
                }
            }
        }
        .padding()
        .background(secondaryBackgroundColor)
        .cornerRadius(20)
    }
}


extension CalculatorButtonsView {
    func buttonPressed(calcButton: CalcButton) {
        switch calcButton {
        case .clear:
            currentComputation = ""
            mainResult = "0"
        case .equal, .negative:
            if !currentComputation.isEmpty {
                if !lastCharacterIsOperator(str: currentComputation) {
                    let sign = calcButton == .negative ? -1.0 : 1.0
                    let calculatedValue = calculateResults()
                    let formattedResult = formatResult(val: sign * calculatedValue)
                    mainResult = formattedResult
                    if calcButton == .negative {
                        currentComputation = mainResult
                    }
                }
            }
        case .decimal:
            if let lastOcc = currentComputation.lastIndex(of: ".") {
                if lastCharIsDigit(str: currentComputation) {
                    let startIndex = currentComputation.index(lastOcc, offsetBy: 1)
                    let endIndex = currentComputation.endIndex
                    let range = startIndex..<endIndex
                    let rightSubstring = String(currentComputation[range])
                    if Int(rightSubstring) == nil && !rightSubstring.isEmpty {
                        currentComputation += "."
                    }
                }
            } else {
                if currentComputation.isEmpty {
                    currentComputation += "0."
                } else if lastCharIsDigit(str: currentComputation) {
                    currentComputation += "."
                }
            }
        case .percent:
            if lastCharIsDigitOrPercent(str: currentComputation) {
                appendToCurrentComputation(calcButton: calcButton)
            }
        case .undo:
            currentComputation = String(currentComputation.dropLast())
        case .add, .subtract, .divide, .multiply:
            if lastCharIsDigit(str: currentComputation) {
                appendToCurrentComputation(calcButton: calcButton)
            }
        default:
            appendToCurrentComputation(calcButton: calcButton)
        }
    }
    
    func appendToCurrentComputation(calcButton: CalcButton) {
        currentComputation += calcButton.rawValue
    }
    
    func calculateResults() -> Double {
        let working: String = currentComputation

        var workingsReal = working.replacingOccurrences(of: "%", with: "*0.01")
        workingsReal = workingsReal.replacingOccurrences(of: multiplySymbol, with: "*")
        workingsReal = workingsReal.replacingOccurrences(of: divisionSymbol, with: "/")

        if getLastChar(str: working) == "." {
            workingsReal += "0"
        }

        let expr = NSExpression(format: workingsReal)
        if let exprVal = expr.expressionValue(with: nil, context: nil) as? Double {
            return exprVal
        } else {
            return 0
        }
    }

}

struct CalculatorButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButtonsView(mainResult: .constant("0"), currentComputation: .constant("5+1"))
    }
}
