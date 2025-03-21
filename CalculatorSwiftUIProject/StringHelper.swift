import Foundation

func getLastChar(str: String) -> String {
    str.isEmpty ? "" : String(str.last!)
}

func lastCharacterIsEqual(str: String, char: String) -> Bool {
    getLastChar(str: str) == char
}
 
func formatResult(val: Double) -> String {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    numberFormatter.maximumFractionDigits = 16
    let result = numberFormatter.string(from: NSNumber(value: val))
    return result ?? "0"
}
