//
//  NotificationCell.swift
//  Lecture5_Cubstart
//
//  Created by Marco Monfiglio on 2/28/22.
//

import SwiftUI

struct NotificationCell: View {
    var body: some View {
        HStack {
            Image(systemName: "heart.fill")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .clipShape(Circle())
            .frame(width: 35, height: 35)
            .padding()
        
        Text("Oski started following you!")
        
        Spacer()
        
        Button("Follow") {
            print("You follow Oski")
            }
            .border(Color.black, width: 1)
            .padding()
        }
    }
}
