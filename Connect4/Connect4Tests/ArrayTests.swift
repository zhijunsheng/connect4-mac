//
//  ArrayTests.swift
//  Connect4Tests
//
//  Created by Golden Thumb on 2020-11-09.
//

import XCTest
@testable import Connect4

class ArrayTests: XCTestCase {
    
    func testConn4PieceArray() {
        var pieces: [Conn4Piece] = []
        XCTAssertEqual(0, pieces.count)
        
        pieces.append(Conn4Piece(col: 0, row: 0, player: .red))
        XCTAssertEqual(1, pieces.count)
    }
    
    func testStringArray() {
        var names: [String] = []
        names.append("Donald Trump")
        names.append("Golden Thumb")
        
        for i in 0..<names.count {
            print(names[i])
        }
        
        for name in names {
            print(name)
        }
    }

    func testIntArray() {
        var intArr: [Int] = [2, 3, 5, 7, 11]
        XCTAssertEqual(11, intArr[intArr.count - 1])
        
        intArr.append(13) // [2, 3, 5, 7, 11, 13]
        XCTAssertEqual(13, intArr[intArr.count - 1])
        
//        for _ in 0..<intArr.count {
//            intArr.remove(at: 0)
//        }
//        intArr.removeAll()
        intArr = [1, 2, 3, 4, 5]
        
        for i in 0..<intArr.count {
            print("i = \(i), intArr[i] = \(intArr[i])")
        }
        
        for intNum in intArr {
            print(intNum)
        }
    }
}
