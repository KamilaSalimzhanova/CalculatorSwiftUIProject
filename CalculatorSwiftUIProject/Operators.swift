import Foundation

enum Operaton {
    case add
    case multiply
    case subtract
    case divide
    case equal
    case none
}

enum CalcButton: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case add = "+"
    case subtract = "-"
    case divide = "÷"
    case multiply = "×"
    case clear = "AC"
    case equal = "="
    case decimal = "."
    case percent = "%"
    case negative = "IMGplus.forwardslash.minus"
    case undo = "IMGarrouw.counterclockwise"
}

let enumOperators: [CalcButton] = [.add, .subtract, .divide, .multiply]
let multiplySymbol = CalcButton.multiply.rawValue
let divisionSymbol = CalcButton.divide.rawValue
let operators: String = "+-\(multiplySymbol)\(divisionSymbol)"
