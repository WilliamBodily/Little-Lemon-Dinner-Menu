//
//  MenuItemsTest.swift
//  LittleLemonDinnerMenuTests
//
//  Created by William Bodily on 12/1/24.
//

import XCTest

@testable import LittleLemonDinnerMenu

final class MenuItemsTest: XCTestCase {

    func test_menuItemTitle() {
        var menuItem = MenuItem(price: 24.00, title: "Test Food Title", menuCategory: .food, orders: 50, ingredients: [.broccoli, .pasta], image: "Food")
        
        XCTAssert(menuItem.title == "Test Food Title")
    }
    
    func test_menuItemIngredients() {
        var menuItem = MenuItem(price: 24.00, title: "Test Food Title", menuCategory: .food, orders: 50, ingredients: [.broccoli, .pasta], image: "Food")
        
        XCTAssert(menuItem.ingredients == [.broccoli, .pasta])
    }
    
    func test_initsomething() {
    }

}
