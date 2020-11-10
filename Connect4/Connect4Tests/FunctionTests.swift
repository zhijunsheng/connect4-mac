//
//  FunctionTests.swift
//  Connect4Tests
//
//  Created by Golden Thumb on 2020-11-10.
//

import XCTest

class FunctionTests: XCTestCase {

    func testFunction() {
        let prod = productOf(x: 2, y: 3)
        print(prod)
    }
    
    func productOf(x: Int, y: Int) -> Int {
        let product = x * y
        return product
    }
    
    func sumUp(a: Int, b: Int, c: Int) {
        let sum = a + b + c
        print("sum = \(sum)")
    }
    
    func sayHelloTo(name: String) {
        print("Hello, \(name)!")
        print("Hello again.")
    }

    func sayHello() {
        print("Hello, friend!")
        print("Hello again.")
    }
}
