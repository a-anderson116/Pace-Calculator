//
//  Miles.swift
//  Pace Calculator
//
//  Created by Alex Anderson on 11/22/22.
//

import SwiftUI

struct Miles: View {
    @State private var DistanceMTextField = ""
    @State private var TotalTimeMinTextField = ""
    @State private var TotalTimeSecTextField = ""
    @State private var PacePerMin = 0
    @State private var PacePerSec = 0.0
    @State private var Pace = "/"
    var body: some View {
        VStack{
            CustomText(text:"Pace Calculator:")
            CustomText(text:"Miles")
            CustomTextField(placeholder: "Distance Ran (in miles)", variable: $DistanceMTextField)
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
            if let miles = Double(DistanceMTextField){
                if let min = Double(TotalTimeMinTextField){
                    if let sec = Double(TotalTimeSecTextField){
                       
                        PacePerMin = Int((((min * 60) + sec) / 60) / miles)
                        PacePerSec = (((((min * 60) + sec) / 60) / miles) - Double(PacePerMin)) * 60
                    }
                }
            }
            }.padding()
            HStack{  CustomText2(text: "Your Pace was ")
                CustomText2(text: "\(PacePerMin) :")
                CustomText2(text: String(format: "%.2f", PacePerSec))
                CustomText2(text: "Min/Mile ")
            }
            Spacer()
        }
    }
}
struct Miles_Previews: PreviewProvider {
    static var previews: some View {
        Miles()
    }
}
struct CustomText2: View {
    let text: String
    var body: some View{
        Text(text).font(Font.custom("Comic Sans", size: 20))
    }
}
struct CustomTextField: View {
    let placeholder : String
    let variable : Binding<String>
    var body: some View {
        TextField(placeholder, text:variable)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .multilineTextAlignment(.center)
            .frame(width: 200, height: 30, alignment: .center)
            .font(.body)
            .padding()
    }
}
