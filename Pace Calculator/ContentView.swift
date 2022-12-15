//
//  ContentView.swift
//  Pace Calculator
//
//  Created by Alex Anderson on 11/21/22.
//  Finished by Alex Anderson on 12/15/22
//

import SwiftUI
struct ContentView: View {
    @State private var nameTextFieldView = ""
    @State private var name = ""
    var body: some View {
        NavigationView{
            ZStack{
                Color.white.opacity(0.9).ignoresSafeArea()
                Color.orange.opacity(0.1).ignoresSafeArea()
                VStack {
                    CustomText(text:"Pace Calculator")
                    CustomText(text: "and")
                    CustomText(text: "Conversion Tool")
                    Image("RunnerPic").resizable().frame(width: 450, height: 300)
                    Spacer()
                    TextField("What's Your Name", text: $nameTextFieldView).textFieldStyle(RoundedBorderTextFieldStyle())
                        .multilineTextAlignment(.center)
                        .frame(width:200)
                    VStack{
                        NavigationLink("Pace per Mile", destination: Miles(name: nameTextFieldView)).font(.system(size:20)).fontWeight(.heavy).padding()
                        Text("____________________")
                        NavigationLink("Pace per Kilometer" , destination: Kilometers(name: nameTextFieldView)).font(.system(size:20)).fontWeight(.heavy).padding()
                        Text("____________________")
                        NavigationLink("Conversion Tool" , destination: Conversion()).font(.system(size:20)).fontWeight(.heavy).padding()
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct CustomText: View {
    let text: String
    var body: some View{
        Text(text).font(Font.custom("Impact", size: 35))
    }
}

