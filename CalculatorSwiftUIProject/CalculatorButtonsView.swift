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
                            print("Button is pressed")
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

struct CalculatorButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButtonsView(mainResult: .constant("0"), currentComputation: .constant("5+1"))
    }
}
