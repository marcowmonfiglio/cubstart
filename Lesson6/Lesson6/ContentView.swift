//
//  ContentView.swift
//  Lesson6
//
//  Created by Marco Monfiglio on 3/7/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var name: String = ""
    @State var emailVar: String = ""
    @State var isOn: Bool = true
    @State var bio: String = ""

    var body: some View {
        NavigationView {
            Form {
                
                Section {
                    VStack {
                        Image(systemName: "")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                        HStack {
                            Text("NAME:")
                            TextField("Name", text: $name) //dollar sign taken in a binding variable
                        }
                        
                        HStack {
                            Text("EMAIL:")
                            TextField("Email", text: $emailVar)
                        }
                        
                        Toggle(isOn: $isOn) {
                        Text("Private Account")
                        }
                        
                        HStack {
                            Text("BIO:")
                            TextField("Bio", text: $bio)
                        }
                        
                    }
                }
                Section {
                    NavigationLink(destination: Text("Privacy:")) {
                        Text("Privacy Settings")
                    }
                }
                
                
            }
        }
    }
}







//class Fruit: ObservableObject {
//    @Published var name = ""
//}
//
//struct  InnerView: View {
//    @ObservedObject var fruit = Fruit()
//    var body: some View {
//        Button("Change Fruit") {
//            fruit.name = "orange"
//        }
//    }
//}
//
//
//struct ContentView: View {
//
//    @StateObject var fruit = Fruit()
//
//    var body: some View {
//        VStack() {
//            Text("Your fruit is \(fruit.name)")
//            InnerView(fruit: fruit) //InnerView() followed by .environmentObject(fruit)
//        }
//
//    }
//}
