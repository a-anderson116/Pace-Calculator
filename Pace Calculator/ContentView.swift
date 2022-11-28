//
//  ContentView.swift
//  Pace Calculator
//
//  Created by Alex Anderson on 11/21/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack {
                CustomText(text:"Pace Calculator").bold()
                Spacer()
                Image("RunnerPic").resizable().frame(width: 500, height: 400)
                NavigationLink("Miles", destination: Miles()).font(.system(size:34)).fontWeight(.heavy).padding()
                Text("OR").font(.system(size:25)).fontWeight(.heavy).padding()
                NavigationLink("Kilometers" , destination: Kilometers()).font(.system(size:34)).fontWeight(.heavy).padding()
            }
            .padding()
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
        Text(text).font(Font.custom("Impact", size: 45))
    }
}
