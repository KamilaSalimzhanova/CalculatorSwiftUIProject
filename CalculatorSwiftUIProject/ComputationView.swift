//
//  ComputationView.swift
//  CalculatorSwiftUIProject
//
//  Created by kamila on 21.03.2025.
//

import SwiftUI

struct ComputationView: View {
    var mainResult: String
    var currentComputation: String
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Spacer()
                Text(currentComputation)
                    .foregroundColor(digitsColor)
                    .lineLimit(1)
            }
                .minimumScaleFactor(0.1) // font will shrink up to 10 percent
            
            HStack {
                Spacer()
                Text(mainResult)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(digitsColor)
                    .lineLimit(1)
            }.minimumScaleFactor(0.1)
            
        }.padding(.horizontal)
    }
}

struct ComputationView_Previews: PreviewProvider {
    static var previews: some View {
        ComputationView(mainResult: "11111", currentComputation: "5+1111111")
    }
}
