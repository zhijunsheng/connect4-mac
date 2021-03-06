//
//  Conn4Board.swift
//  Connect4
//
//  Created by Golden Thumb on 2020-11-09.
//

import Foundation

struct Conn4Board: CustomStringConvertible {
    private(set) var piecesBox: [Conn4Piece] = []
    private var playerInTurn: Conn4Player = .red
    
    mutating func dropPieceAt(col: Int) {
        piecesBox.append(Conn4Piece(col: col, row: numberOfPiecesAt(col: col), player: playerInTurn))
        playerInTurn = playerInTurn == .red ? .yellow : .red
    }
    
    private func numberOfPiecesAt(col: Int) -> Int {
        var count: Int = 0
        for piece in piecesBox {
            if piece.col == col {
                count += 1
            }
        }
        return count
    }
    
    func pieceAt(col: Int, row: Int) -> Conn4Piece? {
        for piece in piecesBox {
            if piece.col == col && piece.row == row {
                return piece
            }
        }
        return nil
    }
    
    var description: String {
        var desc: String = ""
        
        for i in 0..<6 {
            desc += "\(5 - i)"
            for col in 0..<7 {
                // if red " r", otherwise yellow " y"
                if let piece = pieceAt(col: col, row: 5 - i) {
                    desc += piece.player == .red ? " r" : " y"
                } else {
                    desc += " ."
                }
            }
            desc += "\n"
        }
        
        desc += "  0 1 2 3 4 5 6"
        
        return desc
    }
}
