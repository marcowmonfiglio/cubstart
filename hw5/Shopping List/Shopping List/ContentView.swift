//
//  ContentView.swift
//  Shopping List
//
//  Created by Tony Hong on 3/11/22.
//

import SwiftUI

class Items: Identifiable {
    
    let imageName: String
    let itemName: String
    let quantity: Int
    
    init(image: String, item: String, amount: Int) {
        self.imageName = image
        self.itemName = item
        self.quantity = amount
    }
}

struct ContentView: View {
    
    var fruitList = [
        Items(image: "banana", item: "Bananas", amount: 3),
        Items(image: "apple", item: "Apples", amount: 4),
        Items(image: "eggs", item: "Eggs", amount: 12)
        ]
    
    var meatList = [
        Items(image: "steak", item: "Steak", amount: 2),
        Items(image: "chicken", item: "Chicken", amount: 3),
        ]
    
    var dessertList = [
        Items(image: "alfajor", item: "Alfajor", amount: 6),
        Items(image: "dulce", item: "Dulce De Leche", amount: 2),
        ]
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Fruits")) {
                    ForEach(fruitList) { i in
                        CustomCell(image: i.imageName, item: i.itemName, amount: i.quantity)
                    }
                }
                
                Section(header: Text("Meat")) {
                    ForEach(meatList) { i in
                        CustomCell(image: i.imageName, item: i.itemName, amount: i.quantity)
                    }
                }
                
                Section(header: Text("Dessert")) {
                    ForEach(dessertList) { i in
                        CustomCell(image: i.imageName, item: i.itemName, amount: i.quantity)
                    }
                }
            
            }.navigationTitle("Shopping List:")
        }
}
}
