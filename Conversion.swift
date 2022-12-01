//
//  Conversion.swift
//  Pace Calculator
//
//  Created by Alex Anderson on 11/30/22.
//

import SwiftUI
struct Conversion: View {
    @State private var MilesTextField01 = 0.0
    @State private var MilesTextField02 = ""
    @State private var KilosTextField01 = 0.0
    @State private var KilosTextField02 = ""
    var body: some View {
        VStack {
            CustomText(text:"Conversion Tool").padding()
            CustomTextField(placeholder: "Distance Ran (in K's)", variable: $KilosTextField02)
            Text("To").padding()
            HStack{
                CustomText2(text: String(format: "%.2f", MilesTextField01))
                CustomText2(text: "Miles")
            }
            Button("Calculate Kilometers -> Miles"){
                if let K = Double(KilosTextField02)
                {
                    
                    MilesTextField01 = K * 0.62
                }
            }.padding()
            CustomTextField(placeholder: "Distance Ran (in Miles)", variable: $MilesTextField02)
            Text("To").padding()
            HStack{
                CustomText2(text: String(format: "%.2f", KilosTextField01))
                CustomText2(text: "Kilometers")
            }
            Button("Calculate Miles -> Kilometers"){
                if let M = Double(MilesTextField02)
                {
                    
                    KilosTextField01 = M / 0.62
                }
            }.padding()
            Spacer()
        }
        
    }
}

struct Conversion_Previews: PreviewProvider {
    static var previews: some View {
        Conversion()
    }
}
