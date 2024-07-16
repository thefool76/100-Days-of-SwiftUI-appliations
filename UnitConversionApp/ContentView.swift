//
//  ContentView.swift
//  UnitConversionApp
//
//  Created by Bhavesh Mishra on 13/07/24.
//

import SwiftUI

struct ContentView: View {
    @State private var inputValue = 0.0
    @State private var inputUnit = "meters"
    @State private var outputUnit = "kilometers"
    
    let units = ["meters", "kilometers", "feet", "yards", "miles"]
    
    var result: Double {
        let meterValues = [1.0, 1000.0, 0.3048, 0.9144, 1609.34]
        
        guard let inputIndex = units.firstIndex(of: inputUnit),
              let outputIndex = units.firstIndex(of: outputUnit) else {
            return 0.0
        }
        
        let inputInMeters = inputValue * meterValues[inputIndex]
        return inputInMeters / meterValues[outputIndex]
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Input")) {
                    TextField("Enter value", value: $inputValue, format: .number)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Select units")) {
                    Picker("Input unit", selection: $inputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    Picker("Output unit", selection: $outputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section(header: Text("Result")) {
                    Text("\(result.formatted()) \(outputUnit)")
                }
            }
            .navigationTitle("Length Converter")
        }
    }
}

#Preview {
    ContentView()
}
