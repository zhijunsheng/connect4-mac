//
//  Conn4BoardTests.swift
//  Connect4Tests
//
//  Created by Golden Thumb on 2020-11-15.
//

import XCTest
@testable import Connect4

class Conn4BoardTests: XCTestCase {
    
    func testDropPieceAt() {
        var conn4Board = Conn4Board()
        
        conn4Board.dropPieceAt(col: 3)
        
        print(conn4Board)
    }

    func testDescription() {
        let conn4Board = Conn4Board()
        
        print(conn4Board)
    }

}