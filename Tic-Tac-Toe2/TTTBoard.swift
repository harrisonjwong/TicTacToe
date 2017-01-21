//
//  TTTBoard.swift
//  Tic-Tac-Toe2
//
//  Created by Harrison Wong on 1/09/2017.
//  Copyright © 2017 Harrison Wong. All rights reserved.
//

import Foundation

class TTTBoard {
    
    //    00 10 20
    //    01 11 21
    //    02 12 22
    
    var boardCells = [Cell(x: 0, y: 0), Cell(x: 1, y: 0), Cell(x: 1, y: 2), Cell(x: 0, y: 1), Cell (x: 1, y: 1), Cell(x: 2, y: 1), Cell(x: 0, y: 2), Cell(x: 1, y: 2), Cell(x: 2, y: 2)]
    
    var expertMode: Bool = false
    
    var currentPlayer: Int = 1
    
    func swapPlayer() {
        if currentPlayer == 1 {
            currentPlayer += 1
        } else if currentPlayer == 2 {
            currentPlayer -= 1
        } else {
            print("something is wrong with the current player")
            print(#function)
        }
    }
    
    func setMode(mode: Bool) {
        expertMode = mode
    }
    
    func doesCellHaveValue(c: Cell)-> Bool {
        if c.value == 0 {
            return false
        } else {
            return true
        }
    }
    
    func checkForEmptyCells()-> Set<Cell> {
        var emptyCells: Set<Cell> = []
        for x in 0..<2 {
            for y in 0..<2 {
                if !doesCellHaveValue(c: Cell(x: x, y: y)) {
                emptyCells.insert(Cell(x: x, y: y))
                }
            }
        }
        return emptyCells
    }
    
    func setValue(c: Cell, val: Int) {
        var c = c
        c.value = val
    }
    
    
    func resetBoard() {
        boardCells.removeAll()
    }
    
    func checkForWinner()-> Int? {
        var exitValue: Int? = nil

        if boardCells[0].value == boardCells[1].value && boardCells[1].value == boardCells[2].value {
            exitValue = boardCells[2].value
        }
        if boardCells[3].value == boardCells[4].value && boardCells[4].value == boardCells[5].value {
            exitValue =  boardCells[4].value
        }
        if boardCells[6].value == boardCells[7].value && boardCells[7].value == boardCells[8].value {
            exitValue = boardCells[7].value
        }
        if boardCells[0].value == boardCells[3].value && boardCells[3].value == boardCells[6].value {
            exitValue = boardCells[6].value
        }
        if boardCells[1].value == boardCells[4].value && boardCells[4].value == boardCells[7].value {
            exitValue = boardCells[4].value
        }
        if boardCells[2].value == boardCells[5].value && boardCells[5].value == boardCells[8].value {
            exitValue = boardCells[5].value
        }
        if boardCells[0].value == boardCells[4].value && boardCells[4].value == boardCells[8].value {
            exitValue = boardCells[4].value
        }
        if boardCells[2].value == boardCells[4].value && boardCells[4].value == boardCells[6].value {
            exitValue = boardCells[4].value
        }
        
        return exitValue
    }
    
    
    

    
}

//func checkForTie()-> Bool {
//    return false
//}


//func changeValue(player: Int, cell: Cell) {
//    var cell = cell
//    if cell.value == 0 {
//        cell.value = player
//    } else {
//        print("Cell already has value")
//    }
//}

//    func reset() {
//        topLeft.value = 0
//        topMiddle.value = 0
//        topRight.value = 0
//        middleLeft.value = 0
//        middleMiddle.value = 0
//        middleRight.value = 0
//        bottomLeft.value = 0
//        bottomMiddle.value = 0
//        bottomRight.value = 0
//    }



//    var topLeft = Cell(value: 0)
//    var topMiddle = Cell(value: 0)
//    var topRight = Cell(value: 0)
//    var middleLeft = Cell(value: 0)
//    var middleMiddle = Cell(value: 0)
//    var middleRight = Cell(value: 0)
//    var bottomLeft = Cell(value: 0)
//    var bottomMiddle = Cell(value: 0)
//    var bottomRight = Cell(value: 0)
//

//


//    func addCell(x: Int, y: Int) {
//        if x >= 0 && x <= 2 && y >= 0 && y <= 2 {
//            var c = Cell(x: x, y: y)
//            if boardCells.contains(c) {
//                if c.value == 0 {
//                    c.setValue(data: currentPlayer)
//                } else {
//                    print("this cell is already taken")
//                    print(#function)
//                }
//            } else {
//                boardCells.insert(c)
//                c.setValue(data: currentPlayer)
//            }
//            swapPlayer()
//        }
//    }





