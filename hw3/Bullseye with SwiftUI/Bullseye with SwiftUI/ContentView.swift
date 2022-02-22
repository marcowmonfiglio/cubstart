//
//  ContentView.swift
//  Bullseye with SwiftUI
//
//  Created by Tony Hong on 2/17/22.
//

import SwiftUI

struct ContentView: View {
    
    var score: Int = 0
    var level: Int = 1
    var currNum: Int = 25
    @State var sliderNum: Double = 50
    @State var toggle = false
    
    var body: some View {
        VStack() {
            HStack() {
                VStack() {
                    Text("High Score")
                    Text(String(score))
                }
                .padding(.leading, 20)
                .padding(.top, 20)
                
                Spacer()
                
                VStack() {
                    Text("Level")
                    Text(String(level))
                }
                .padding(.top, 20)
                .padding(.trailing, 20)
            }
            
            Spacer()
            
            Text("Move the Slider to:")
            .font(.system(size: 30))
            
            Text(String(currNum))
            .font(.system(size: 30))
            
            Slider(value: $sliderNum, in: 0...100)
            
            Button("Check") {
            }
            
            Spacer()
            
            Text("Exact Mode?")
            
            Toggle(isOn: $toggle) {
            }
            .padding(.trailing, 170)
            
        }
    }
}
