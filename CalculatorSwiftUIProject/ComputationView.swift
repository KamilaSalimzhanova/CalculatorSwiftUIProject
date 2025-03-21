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
        VStack{
            Text("Computation view")
            Text(mainResult)
            Text(currentComputation)
        }
    }
}

struct ComputationView_Previews: PreviewProvider {
    static var previews: some View {
        ComputationView(mainResult: "0", currentComputation: "")
    }
}
