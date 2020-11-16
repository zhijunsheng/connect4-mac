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
        
        conn4Board.dropPieceAt(col: 0)
        conn4Board.dropPieceAt(col: 2)
        conn4Board.dropPieceAt(col: 6)
        
        print(conn4Board)
        XCTAssertEqual(3, conn4Board.piecesBox.count)
        XCTAssertEqual(.red, conn4Board.pieceAt(col: 6, row: 0)?.player)
    }

    func testDescription() {
        let conn4Board = Conn4Board()
        
        print(conn4Board)
    }

}
