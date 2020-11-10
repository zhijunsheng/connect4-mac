//
//  ArrayTests.swift
//  Connect4Tests
//
//  Created by Golden Thumb on 2020-11-09.
//

import XCTest

class ArrayTests: XCTestCase {

    func testIntArray() {
        let intArr: [Int] = [2, 3, 5, 7, 11]
        XCTAssertEqual(11, intArr[intArr.count - 1])
    }
}
