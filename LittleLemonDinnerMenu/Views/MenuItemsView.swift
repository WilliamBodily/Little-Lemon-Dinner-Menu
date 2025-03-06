//
//  MenuItemsView.swift
//  LittleLemonDinnerMenu
//
//  Created by William Bodily on 12/1/24.
//

import SwiftUI

struct MenuItemsView: View {
    
    @StateObject var viewModel = MenuViewViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                ScrollView {
                    if viewModel.showFood {
                        VStack(alignment: .leading) {
                            Text("Food")
                                .font(.title)
                            MenuItemView(menuItems: viewModel.foodMenuItems, menuCategory: .food)
                        }
                        .padding()
                    }
                    if viewModel.showDrink {
                        VStack(alignment: .leading) {
                            Text("Drinks")
                                .font(.title)
                            MenuItemView(menuItems: viewModel.drinkMenuItems, menuCategory: .drink)
                        }
                        .padding()
                    }
                    if viewModel.showDessert {
                        VStack(alignment: .leading) {
                            Text("Dessert")
                                .font(.title)
                            MenuItemView(menuItems: viewModel.dessertMenuItems, menuCategory: .dessert)
                        }
                        .padding()
                    }
                }
            }.onAppear() {
                viewModel.updateMenuItemsView()
            }
            .navigationTitle("Menu")
            .toolbar {
                ToolbarItem(id: "Filter") {
                    Button(action: {
                        viewModel.showFilter.toggle()
                    }) {
                        Image(systemName: "slider.horizontal.3")
                            .foregroundColor(.blue)
                    }.sheet(isPresented: $viewModel.showFilter) {
                        NavigationStack {
                            MenuItemsOptionView().environmentObject(viewModel)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    MenuItemsView()
}
