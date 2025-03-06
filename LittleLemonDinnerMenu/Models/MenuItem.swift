//
//  MenuItem.swift
//  LittleLemonDinnerMenu
//
//  Created by William Bodily on 12/1/24.
//

import Foundation

protocol MenuItemProtocol {
    var id: UUID { get }
    var price: Double { get }
    var title: String { get }
    var menuCategory: MenuCategory { get }
    var orders: Int { get }
    var ingredients: [Ingredient] { get set }
    var image: String { get }
}

struct MenuItem: Identifiable, Hashable {
    var id = UUID()
    var price: Double
    var title: String
    var menuCategory: MenuCategory
    var orders: Int
    var ingredients: [Ingredient] = []
    var image: String
}
