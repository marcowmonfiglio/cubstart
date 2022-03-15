//
//  CustomCell.swift
//  Shopping List
//
//  Created by Tony Hong on 3/12/22.
//

import SwiftUI

struct CustomCell: View {
    
    var image: String
    var item: String
    var amount: Int
    
    
    var body: some View {
        HStack {
            Image(image).resizable().frame(width: 50, height: 50, alignment: .leading)
            Text("\(item)")
            Spacer()
            Text("\(amount)")
        }
    }
}
