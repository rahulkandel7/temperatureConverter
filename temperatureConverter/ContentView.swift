//
//  ContentView.swift
//  temperatureConverter
//
//  Created by Rahul Sharma on 27/12/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var inputConversion = "Celcius"
    @State private var outputConversion = "Farenheit"
    
    @State private var temperature:Double =  32.0
    
    let conversions = ["Celcius", "Farenheit","Kelvin"]
    
    var convertedTemperature:Double {

        if(inputConversion == "Celcius") {
            if(outputConversion == "Farenheit") {
                let temp  = temperature * (9/5) + 32
                return temp
            } else if(outputConversion == "Kelvin") {
                let temp  = temperature  + 273.15
                return temp
            }
            else {
                return temperature
            }
        } else if(inputConversion == "Farenheit") {
            if(outputConversion == "Celcius") {
                let temp  = (temperature - 32) * 5/9
                return temp
            } else if(outputConversion == "Kelvin") {
                let temp  = (temperature - 32) * 5/9 + 273.15
                return temp
            } else {
                return temperature
            }
        }
        else  {
            if(outputConversion == "Celcius") {
                let temp  = temperature - 273.15
                return temp
            } else if(outputConversion == "Farenheit") {
                let temp  = (temperature - 273.15) * 9/5 + 32; return temp
            } else {
                return temperature
            }
        }
      
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section ("Select the input conversion") {
                    Picker("Select Conversion", selection: $inputConversion, content: {
                        ForEach(conversions, id: \.self, content: {conversion in
                        Text(conversion)
                        }
                        )
                    }
                    ).pickerStyle(.segmented)
                }
                
                Section("Provide the temperature") {
                    TextField("Temperature", value: $temperature, format: .number)
                }
                
                Section ("Select the output conversion") {
                    Picker("Select Conversion", selection: $outputConversion, content: {
                        ForEach(conversions, id: \.self, content: {conversion in
                        Text(conversion)
                        }
                        )
                    }
                    ).pickerStyle(.segmented)
                }
                
                Section {
                    Text("Converted temperature: \(convertedTemperature,specifier: "%.2f")º \(outputConversion)")
                }
                
            }
            .navigationTitle("Temperature Converter")
        }
            }
}

#Preview {
    ContentView()
}
