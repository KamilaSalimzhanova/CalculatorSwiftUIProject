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
    var body: some View {
        HStack {
            Spacer()
            Text(currentComputation)
                .foregroundColor(digitsColor)
                .lineLimit(1)
        }.padding(.horizontal)
            .minimumScaleFactor(0.1) // font will 
        Text(mainResult)
    }
}

struct CalculatorButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButtonsView(mainResult: .constant("0"), currentComputation: .constant("5+1"))
    }
}
