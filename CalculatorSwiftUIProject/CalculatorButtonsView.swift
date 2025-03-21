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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CalculatorButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButtonsView(mainResult: .constant("0"), currentComputation: .constant(""))
    }
}
