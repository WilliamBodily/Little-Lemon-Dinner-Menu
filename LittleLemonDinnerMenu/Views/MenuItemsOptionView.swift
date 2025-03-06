//
//  MenuItemsOptionView.swift
//  LittleLemonDinnerMenu
//
//  Created by William Bodily on 12/1/24.
//

import SwiftUI

enum FilterCategories: String, CaseIterable {
    case all = "All"
    case none = "None"
    case foodDrink = "Food & Drink"
    case foodDessert = "Food & Dessert"
    case drinkDessert = "Drink & Dessert"
    case food = "Food"
    case drink = "Drink"
    case dessert = "Dessert"
}

enum SortingOptions: String, CaseIterable {
    case mostPopular = "Most Popular"
    case price = "Price $-$$$"
    case alphabetical = "A-Z"
}

struct MenuItemsOptionView: View {
    
    @EnvironmentObject var viewModel: MenuViewViewModel
    
    var body: some View {
        NavigationStack {
                List {
                    Section("SELECTED CATEGORIES") {
                        Button(action: {
                            viewModel.showFood.toggle()
                            setFilterState()
                        }, label: {
                            if viewModel.showFood {
                                Text(FilterCategories.food.rawValue)
                                    .foregroundColor(.black)
                            } else {
                                Text(FilterCategories.food.rawValue)
                                    .foregroundColor(.gray)
                            }
                        })
                        Button(action: {
                            viewModel.showDrink.toggle()
                            setFilterState()
                        }, label: {
                            if viewModel.showDrink {
                                Text(FilterCategories.drink.rawValue)
                                    .foregroundColor(.black)
                            } else {
                                Text(FilterCategories.drink.rawValue)
                                    .foregroundColor(.gray)
                            }
                        })
                        Button(action: {
                            viewModel.showDessert.toggle()
                            setFilterState()
                        }, label: {
                            if viewModel.showDessert {
                                Text(FilterCategories.dessert.rawValue)
                                    .foregroundColor(.black)
                            } else {
                                Text(FilterCategories.dessert.rawValue)
                                    .foregroundColor(.gray)
                            }
                        })
                    }
                    Section("SORT BY") {
                        Button(action: {
                            viewModel.sortOn = .mostPopular
                        }, label: {
                            if viewModel.sortOn == .mostPopular {
                                Text(SortingOptions.mostPopular.rawValue)
                                    .foregroundColor(.black)
                            } else {
                                Text(SortingOptions.mostPopular.rawValue)
                                    .foregroundColor(.gray)
                            }
                        })
                        Button(action: {
                            viewModel.sortOn = .price
                        }, label: {
                            if viewModel.sortOn == .price {
                                Text(SortingOptions.price.rawValue)
                                    .foregroundColor(.black)
                            } else {
                                Text(SortingOptions.price.rawValue)
                                    .foregroundColor(.gray)
                            }
                        })
                        Button(action: {
                            viewModel.sortOn = .alphabetical
                        }, label: {
                            if viewModel.sortOn == .alphabetical {
                                Text(SortingOptions.alphabetical.rawValue)
                                    .foregroundColor(.black)
                            } else {
                                Text(SortingOptions.alphabetical.rawValue)
                                    .foregroundColor(.gray)
                            }
                        })
                    }
                }
            .navigationTitle("Filter")
            .toolbar {
                ToolbarItem(id: "") {
                    Button("Done", action: {
                        viewModel.updateMenuItemsView()
                        viewModel.showFilter = false
                    })
                }
            }
        }
    }
    
    func setFilterState() {
        if viewModel.showFood && viewModel.showDrink && viewModel.showDessert {
                viewModel.filterOn = .all
        } else if viewModel.showFood && viewModel.showDrink && !viewModel.showDessert {
            viewModel.filterOn = .foodDrink
        } else if viewModel.showFood && !viewModel.showDrink && viewModel.showDessert {
                viewModel.filterOn = .foodDessert
        } else if !viewModel.showFood && viewModel.showDrink && viewModel.showDessert {
            viewModel.filterOn = .drinkDessert
        } else if viewModel.showFood && !viewModel.showDrink && !viewModel.showDessert {
            viewModel.filterOn = .food
        } else if !viewModel.showFood && viewModel.showDrink && !viewModel.showDessert {
            viewModel.filterOn = .drink
        } else if !viewModel.showFood && !viewModel.showDrink && viewModel.showDessert {
            viewModel.filterOn = .dessert
        } else if !viewModel.showFood && !viewModel.showDrink && !viewModel.showDessert {
            viewModel.filterOn = .none
        }
    }
}

#Preview {
    MenuItemsOptionView().environmentObject(MenuViewViewModel())
}
