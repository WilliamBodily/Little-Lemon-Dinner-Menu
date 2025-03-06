//
//  MenuViewViewModel.swift
//  LittleLemonDinnerMenu
//
//  Created by William Bodily on 12/1/24.
//

import Foundation

class MenuViewViewModel: ObservableObject {
    
    @Published var showFilter = false
    
    @Published var filterOn: FilterCategories = .all
    @Published var sortOn: SortingOptions = .alphabetical
    
    @Published var showFood = true
    @Published var showDrink = true
    @Published var showDessert = true
    
    var foodMenuItems: [MenuItem] = [
        MenuItem(price: 20.00, title: "Food 1", menuCategory: .food, orders: 20, ingredients: [.broccoli, .pasta], image: "Food"),
        MenuItem(price: 24.50, title: "Food 2", menuCategory: .food, orders: 55, ingredients: [.carrot, .pasta, .tomatoSauce], image: "Food"),
        MenuItem(price: 22.00, title: "Food 3", menuCategory: .food, orders: 40, ingredients: [.spinach, .pasta], image: "Food"),
        MenuItem(price: 25.00, title: "Food 4", menuCategory: .food, orders: 33, ingredients: [.broccoli, .carrot], image: "Food"),
        MenuItem(price: 21.50, title: "Food 5", menuCategory: .food, orders: 52, ingredients: [.carrot, .pasta], image: "Food"),
        MenuItem(price: 26.00, title: "Food 6", menuCategory: .food, orders: 26, ingredients: [.spinach, .pasta], image: "Food"),
        MenuItem(price: 24.00, title: "Food 7", menuCategory: .food, orders: 47, ingredients: [.pasta, .tomatoSauce], image: "Food"),
        MenuItem(price: 20.50, title: "Food 8", menuCategory: .food, orders: 38, ingredients: [.broccoli, .spinach], image: "Food"),
        MenuItem(price: 22.50, title: "Food 9", menuCategory: .food, orders: 27, ingredients: [.broccoli, .carrot, .spinach], image: "Food"),
        MenuItem(price: 21.00, title: "Food 10", menuCategory: .food, orders: 18, ingredients: [.carrot, .pasta, .spinach], image: "Food"),
        MenuItem(price: 23.00, title: "Food 11", menuCategory: .food, orders: 79, ingredients: [.pasta, .tomatoSauce, .spinach], image: "Food"),
        MenuItem(price: 28.00, title: "Food 12", menuCategory: .food, orders: 111, ingredients: [.broccoli, .carrot, .pasta, .spinach, .tomatoSauce], image: "Food")
    ]
    
    var drinkMenuItems: [MenuItem] = [
        MenuItem(price: 11.00, title: "Drink 1", menuCategory: .drink, orders: 47, ingredients: [], image: "Drink"),
        MenuItem(price: 9.00, title: "Drink 2", menuCategory: .drink, orders: 59, ingredients: [], image: "Drink"),
        MenuItem(price: 10.50, title: "Drink 3", menuCategory: .drink, orders: 37, ingredients: [], image: "Drink"),
        MenuItem(price: 13.00, title: "Drink 4", menuCategory: .drink, orders: 88, ingredients: [], image: "Drink"),
        MenuItem(price: 11.50, title: "Drink 5", menuCategory: .drink, orders: 59, ingredients: [], image: "Drink"),
        MenuItem(price: 10.00, title: "Drink 6", menuCategory: .drink, orders: 33, ingredients: [], image: "Drink"),
        MenuItem(price: 12.00, title: "Drink 7", menuCategory: .drink, orders: 97, ingredients: [], image: "Drink"),
        MenuItem(price: 14.00, title: "Drink 8", menuCategory: .drink, orders: 34, ingredients: [], image: "Drink")
    ]
    
    var dessertMenuItems: [MenuItem] = [
        MenuItem(price: 14.00, title: "Dessert 1", menuCategory: .dessert, orders: 112, ingredients: [], image: "Dessert"),
        MenuItem(price: 12.00, title: "Dessert 2", menuCategory: .dessert, orders: 165, ingredients: [], image: "Dessert"),
        MenuItem(price: 10.00, title: "Dessert 3", menuCategory: .dessert, orders: 76, ingredients: [], image: "Dessert"),
        MenuItem(price: 11.00, title: "Dessert 4", menuCategory: .dessert, orders: 57, ingredients: [], image: "Dessert")
    ]

    func filterMenuView() {
        switch filterOn {
        case .all:
            showFood = true
            showDrink = true
            showDessert = true
        case .none:
            showFood = false
            showDrink = false
            showDessert = false
        case .foodDrink:
            showFood = true
            showDrink = true
            showDessert = false
        case .foodDessert:
            showFood = true
            showDrink = false
            showDessert = true
        case .drinkDessert:
            showFood = false
            showDrink = true
            showDessert = true
        case .food:
            showFood = true
            showDrink = false
            showDessert = false
        case .drink:
            showFood = false
            showDrink = true
            showDessert = false
        case .dessert:
            showFood = false
            showDrink = false
            showDessert = true
        }
    }
    
    func sortMenuView() {
        switch sortOn {
        case .mostPopular:
            foodMenuItems.sort { $0.orders > $1.orders }
            drinkMenuItems.sort { $0.orders > $1.orders }
            dessertMenuItems.sort { $0.orders > $1.orders }
        case .price:
            foodMenuItems.sort { $0.price < $1.price }
            drinkMenuItems.sort { $0.price < $1.price }
            dessertMenuItems.sort { $0.price < $1.price }
        case .alphabetical:
            foodMenuItems.sort { sortAlphabetically(lhs: $0, rhs: $1) }
            drinkMenuItems.sort { sortAlphabetically(lhs: $0, rhs: $1) }
            dessertMenuItems.sort { sortAlphabetically(lhs: $0, rhs: $1) }
        }
    }
    
    private func sortAlphabetically(lhs: MenuItem, rhs: MenuItem) -> Bool {
        
        let lhsTitle = lhs.title.split(separator: " ")
        let rhsTitle = rhs.title.split(separator: " ")
        let lhsNumber = Int(lhsTitle[lhsTitle.count - 1]) ?? 0
        let rhsNumber = Int(rhsTitle[rhsTitle.count - 1]) ?? 0
        
        return lhsNumber != rhsNumber ? lhsNumber < rhsNumber : lhs.title < rhs.title
    }
    
    func updateMenuItemsView() {
        filterMenuView()
        sortMenuView()
    }
    
}
