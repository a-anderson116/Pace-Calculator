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
    @State private var PacePerMilesMin = 0
    @State private var PacePerMilesSec = 0.0
    @State private var Pace = "/"
    var body: some View {
        VStack{
            CustomText2(text:"Pace Calculator:")
            CustomText2(text:"Miles")
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
            if let miles = Int(DistanceMTextField){
                if let min = Int(TotalTimeMinTextField){
                    if let sec = Int(TotalTimeSecTextField){
                        PacePerMilesMin = min / miles
                        PacePerMilesSec = Double(sec / miles)
                    }
                }
            }
        }.padding()
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
        Text(text).font(Font.custom("Impact", size: 45))
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
