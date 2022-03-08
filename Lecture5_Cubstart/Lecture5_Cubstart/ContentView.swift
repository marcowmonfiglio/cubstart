//
//  ContentView.swift
//  Lecture5_Cubstart
//
//  Created by Marco Monfiglio on 2/28/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ForEach(0..<5) {_ in
                NotificationCell()
            }
        }
        
        Spacer ()
        
        
        
        
        
        
        
        
        
        
        
//        NavigationView {
//        List {
//            Section(header: Text("General")) {
//                NavigationLink(destination: Text("Airplane Mode")) { //Airplane Mode
//                    Text("Airplane Mode")
//                }
//                NavigationLink(destination: Text("Wi-Fi")) { //Wifi
//                    Text("Wi-Fi")
//                }
//                NavigationLink(destination: Text("Bluetooth")) { //Bluetooth
//                    Text("Bluetooth")
//                }
//                NavigationLink(destination: Text("Cellular")) { //Cellular
//                    Text("Cellular")
//                }
//                NavigationLink(destination: Text("Hotspot")) { //Hotspot
//                    Text("Hotspot")
//                }
//            }
//
//            Section(header: Text("General 2")) {
//                NavigationLink(destination: Text("Notifications")) {
//                    Text("Notifications")
//                }
//                NavigationLink(destination: Text("Sounds and Haptics")) {// Sounds and Haptics
//                    Text("Sounds and Haptics")
//                }
//                NavigationLink(destination: Text("Focus")) { //Focus
//                    Text("Focus")
//                }
//                NavigationLink(destination: Text("Screen Time")) { //Screen Time
//                    Text("Screen Time")
//                }
//            }
//
//            let names = ["Marco", "Washington", "Monfiglio"]
//            Section(header: Text("General 3")) {
//                ForEach(names, id: \.self) { name in
//                    Text(name)
//                }
//            }
//
//        }
//        .listStyle(GroupedListStyle())
//        .navigationBarTitle(Text("Settings"))
//    }
}
}

//let names = ["Marco", "Mateo", "Carlos"]
//        ForEach(names, id: \.self) { name in
//            Text(name)
//        }
