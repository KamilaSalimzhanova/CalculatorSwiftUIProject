import Foundation

func getLastChar(str: String) -> String {
    str.isEmpty ? "" : String(str.last!)
}

func lastCharacterIsEqual(str: String, char: String) -> Bool {
    getLastChar(str: str) == char
}
 
func formatResult(val: Double) -> String {
    guard val.isFinite else { return "0" }
    
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    numberFormatter.maximumFractionDigits = 16
    
    let result = numberFormatter.string(from: NSNumber(value: val))
    return result ?? "0"
}


func lastCharIsDigit(str: String) -> Bool {
    return "0123456789".contains(getLastChar(str: str))
}

func lastCharIsDigitOrPercent(str: String) -> Bool {
    return "0123456789%".contains(getLastChar(str: str))
}

func lastCharacterIsOperator(str: String) -> Bool {
    return operators.contains(getLastChar(str: str))
}
