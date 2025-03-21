import SwiftUI

struct CalcButtonModel: Identifiable {
    let id = UUID()
    let calcButton: CalcButton
    var color: Color = digitsColor
}

struct RowofCalcButtonsModel: Identifiable {
    let id = UUID()
    let row: [CalcButtonModel]
}
