//
//  Kilometers.swift
//  Pace Calculator
//
//  Created by Alex Anderson on 11/22/22.
//

import SwiftUI
struct Kilometers: View {
    @State private var DistanceKTextField = ""
    @State private var TotalTimeMinTextField = ""
    @State private var TotalTimeSecTextField = ""
    @State private var PacePerMin = 0
    @State private var PacePerSec = 0.0
    var body: some View {
        VStack{
            CustomText(text:"Pace Calculator:")
            CustomText(text:"Kilometers")
            CustomTextField(placeholder: "Distance Ran (in K's)", variable: $DistanceKTextField)
            HStack{
                TextField("Minutes", text: $TotalTimeMinTextField).textFieldStyle(RoundedBorderTextFieldStyle())
                    .multilineTextAlignment(.center)
                    .frame(width:100)
                Text(":")
                TextField("Seconds", text: $TotalTimeSecTextField).textFieldStyle(RoundedBorderTextFieldStyle())
                    .multilineTextAlignment(.center)
                    .frame(width:100)
            }
            Button("Calculate"){
                if let Kilometers = Double(DistanceKTextField){
                    if let min = Double(TotalTimeMinTextField){
                        if let sec = Double(TotalTimeSecTextField){
                            
                            PacePerMin = Int((((min * 60) + sec) / 60) / Kilometers)
                            PacePerSec = (((((min * 60) + sec) / 60) / Kilometers) - Double(PacePerMin)) * 60
                        }
                    }
                }
            }.padding()
            HStack{  CustomText2(text: "Your Pace was ")
                CustomText2(text: "\(PacePerMin) :")
                CustomText2(text: String(format: "%.2f", PacePerSec))
                CustomText2(text: "Min/Kilometer ")
            }
            Spacer()
        }
    }
}
struct Kilometers_Previews: PreviewProvider {
    static var previews: some View {
        Kilometers()
    }
}
