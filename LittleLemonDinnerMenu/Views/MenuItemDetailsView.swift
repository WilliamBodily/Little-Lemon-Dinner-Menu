//
//  MenuItemDetailsView.swift
//  LittleLemonDinnerMenu
//
//  Created by William Bodily on 12/1/24.
//

import SwiftUI

struct MenuItemDetailsView: View {
    
    var menuItem: MenuItem
    
    init(menuItem: MenuItem) {
        self.menuItem = menuItem
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("Little Lemon logo")
                //Image(menuItem.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 400, height: 400)
            }.padding()
            VStack {
                Text("Price:")
                    .bold()
                Text(String(format: "%.2f", menuItem.price))
            }
            VStack {
                Text("Ordered:")
                    .bold()
                Text("\(menuItem.orders)")
            }
            VStack {
                Text("Ingredients:")
                    .bold()
                ForEach(menuItem.ingredients, id: \.self) {
                    Text($0.rawValue)
                }
            }
            .navigationTitle(menuItem.title)
        }
    }
}

#Preview {
    MenuItemDetailsView(menuItem: MenuItem(price: 24.00, title: "Food 12", menuCategory: .food, orders: 50, ingredients: [.broccoli, .carrot, .pasta, .spinach, .tomatoSauce], image: "Food"))
    
    
}
