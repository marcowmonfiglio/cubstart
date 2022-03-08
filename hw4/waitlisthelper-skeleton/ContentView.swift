//
//  ContentView.swift
//  waitlisthelper-skeleton
//
//  Created by Jordan Yee on 1/19/22.
//

import SwiftUI

struct ContentView: View {
    @State private var waitlistPlace: Double = 0
    @State private var classSize: Double = 0
    @State private var calculate = false
    @State var probability = 0
    @State var text = ""
    
    var body: some View {
    NavigationView {
        
        TabView {
        //YOUR CODE HERE (NavView)//
    
            //YOUR CODE HERE (TabView)//
    
            ZStack {
                Image("calculate_background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                //YOUR CODE HERE (background)//

                VStack {
                    Spacer()
                    Text("WILL YOU GET OFF THE WAITLIST?")
                        .bold()
                        .foregroundColor(.black)
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .padding()
                    Spacer()
                    HStack {
                        Text("Selected Waitlist Position: \(waitlistPlace, specifier: "%.f")")
                            .frame(maxWidth: .infinity, alignment: .center)
                        Spacer()
                    }
                    Slider(value: $waitlistPlace , in: 0...200, step: 1)
                        .padding()
                        .border(.mint, width: 1)
                        .clipShape(RoundedRectangle(cornerRadius: 3))
                   
                    HStack {
                        Text("Selected Class Size: \(classSize, specifier: "%.f")")
                            .frame(maxWidth: .infinity, alignment: .center)
                        Spacer()
                    }
                    
                    Slider(value: $classSize , in: 0...1000, step: 1)
                        .padding()
                        .border(.mint, width: 1)
                        .clipShape(RoundedRectangle(cornerRadius: 3))
                    
                    NavigationLink(destination: ResultView(prob: $probability, feedback: $text), isActive: $calculate) { EmptyView() }
                        .padding()
                        .navigationBarHidden(true)
                    
                    Button("CALCULATE") {
                        calculateProbability(waitlistPlace: Int(waitlistPlace), classSize: Int(classSize))
                        text = getFeedbackText()
                        calculate = true
                    } .buttonStyle(CustomButton())
                    
                    Spacer()
                    
                } .padding()
                
            }
            .navigationBarTitle("HOME")
            .navigationBarHidden(true)
                .tabItem{
                    Image(systemName: "house.fill")
                    Text("Home")
            }
                .navigationBarHidden(true)
            ZStack {
                Image("calculate_background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                VStack {
                    HStack {
                        Text("MY CLASSES")
                            .font(.system(size: 40, weight: .bold))
                            .foregroundColor(Color.black)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .center)
                        Spacer()
                    } .padding()

                    Spacer()
                    }

            }
            .navigationBarHidden(true)
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
        }
    }
}
    func calculateProbability(waitlistPlace: Int, classSize: Int) {
        let probFactor = Float(waitlistPlace)/Float(classSize)
        if probFactor <= 0.1 {
            probability = 100
        } else if probFactor > 0.2 {
            probability = 0
        } else {
            probability = 100-Int(100 * ((Double(waitlistPlace) - 0.1*Double(classSize)) / (0.1*Double(classSize))))
        }
        
        
    }
    
    func getFeedbackText() -> String {
        for tuple in feedbackModel {
            if probability >= tuple.0 {
                return tuple.1
            }
        }
        return "Error"
    }
}

struct ResultView: View {
    @Environment(\.presentationMode) var presentation: Binding<PresentationMode>
    @Binding var prob: Int
    @Binding var feedback: String
    
    
    var body: some View {

        ZStack {
            Color(red: 50/255, green: 141/255, blue: 168/255)
                .ignoresSafeArea()
            
            Image("result_background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            VStack {
                HStack {
                    Button(action: {
                        self.presentation.wrappedValue.dismiss()}) {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.white)
                        }
                            .navigationBarHidden(true)
                    
                    Spacer()
                } .padding()
                Spacer()
                Text("PROBABILITY:")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                Text("\(prob)%")
                    .font(.system(size: 80, weight: .bold))
                    .foregroundColor(Color.white)
                Text("\(feedback)")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color.white)
                Spacer()
                Spacer()
            } .padding()
        }
    }
}

struct CustomButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(configuration.isPressed ? .cyan : .blue)
            //.background(.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
}
