//
//  MenuItemView.swift
//  LittleLemonDinnerMenu
//
//  Created by William Bodily on 12/1/24.
//

import Foundation
import SwiftUI

struct MenuItemView: View {
    
    @EnvironmentObject var viewModel: MenuViewViewModel
    
    var menuItems: [MenuItem]
    var menuCategory: MenuCategory
    
    init(menuItems: [MenuItem], menuCategory: MenuCategory) {
        self.menuItems = menuItems
        self.menuCategory = menuCategory
    }
    
    var layout = [
        GridItem(.flexible(), spacing:0),
        GridItem(.flexible(), spacing:0),
        GridItem(.flexible(), spacing:0)
    ]
    
    var body: some View {
        LazyVGrid(columns: layout, spacing: 0) {
            ForEach((menuItems), id: \.self) { menuItem in
                NavigationLink(destination: MenuItemDetailsView(menuItem: menuItem)) {
                    VStack {
                        Image(menuItem.image)
                            .resizable()
                            .frame(width: 115, height: 100)
                        Text(menuItem.title)
                            .foregroundColor(.black)
                            .baselineOffset(5)
                    }
                }
            }
        }
    }
}

#Preview {
    MenuItemView(menuItems: MenuViewViewModel().foodMenuItems, menuCategory: .food)
}
