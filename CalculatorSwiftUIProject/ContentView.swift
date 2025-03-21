//
//  ContentView.swift
//  CalculatorSwiftUIProject
//
//  Created by kamila on 21.03.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var lightMode: Bool = true
    @State private var currentComputation: String = ""
    @State private var mainResult: String = "0"
    
    
    var body: some View {
        ZStack {
            backgroundColor.ignoresSafeArea()
            VStack {
                SunMoonView(lightMode: lightMode)
                    .onTapGesture {
                        withAnimation {
                            lightMode.toggle()
                        }
                    }
                Spacer()
                ComputationView(mainResult: mainResult, currentComputation: currentComputation)
                Spacer()
                CalculatorButtonsView(mainResult: $mainResult, currentComputation: $currentComputation)
            }
            .padding()
        }
        .environment(\.colorScheme, lightMode ? .light : .dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
