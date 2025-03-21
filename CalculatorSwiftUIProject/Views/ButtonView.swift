//
//  ButtonView.swift
//  CalculatorSwiftUIProject
//
//  Created by kamila on 21.03.2025.
//

import SwiftUI

struct ButtonView: View {
    let calcButton: CalcButton
    let fgcolor: Color
    let bgcolor: Color
    var systemImage: String? {
        let val = calcButton.rawValue
        return val.contains("IMG") ? val.replacingOccurrences(of: "IMG", with: "") : nil
    }
    var text: String? {
        let val = calcButton.rawValue
        return val.contains("IMG") ? nil : val
    }
    private let buttonDimension: CGFloat = UIScreen.main.bounds.width/5
    
    var body: some View {
        ZStack {
            if let text = text {
                Text(text)
            }
            if let systemImage = systemImage {
                Image(systemName: systemImage)
            }
        }
        .font(.title2)
        .fontWeight(.semibold)
        .frame(width: buttonDimension, height: buttonDimension)
        .foregroundColor(fgcolor)
        .background(bgcolor)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .overlay(RoundedRectangle(cornerRadius: 15).stroke(backgroundColor, lineWidth: 1))
        .shadow(color: bgcolor.opacity(0.5), radius: 3, x: 5, y: 5)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ButtonView(
                calcButton: .one,
                fgcolor: digitsColor,
            bgcolor: buttonBackgroundColor)
            
            ButtonView(
                calcButton: .undo,
                fgcolor: digitsColor,
                bgcolor: buttonBackgroundColor)
        }
    }
}
