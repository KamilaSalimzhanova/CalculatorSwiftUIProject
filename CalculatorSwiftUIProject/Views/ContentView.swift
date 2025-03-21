//
//  ContentView.swift
//  CalculatorSwiftUIProject
//
//  Created by kamila on 21.03.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var lightMode: Bool = false
    @State private var currentComputation: String = "1+1+1"
    @State private var mainResult: String = "2"
    
    
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
