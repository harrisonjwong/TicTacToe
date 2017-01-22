//
//  TTTBoard.swift
//  Tic-Tac-Toe2
//
//  Created by Harrison Wong on 1/09/2017.
//  Copyright © 2017 Harrison Wong. All rights reserved.
//

import Foundation

class TTTBoard : CustomStringConvertible {
    
    //    00 10 20
    //    01 11 21
    //    02 12 22
    
    var boardCells: [Cell] = [Cell(x: 0, y: 0), Cell(x: 1, y: 0), Cell(x: 2, y: 0), Cell(x: 0, y: 1), Cell(x: 1, y: 1), Cell(x: 2, y: 1), Cell(x: 0, y: 2), Cell(x: 1, y: 2), Cell(x: 2, y: 2)]
    
    var expertMode: Bool = false
//        {
//        didSet {
//            print(expertMode)
//        }
//    }
    
    var winner: Int = 0
    
    var currentPlayer: Int = 1
        
    func swapPlayer() {
        if currentPlayer == 1 {
            currentPlayer += 1
        } else if currentPlayer == 2 {
            currentPlayer -= 1
        }
    }
    
    func sendMatchingCellIndex(x: Int, y: Int)-> Int {
        if y == 0 {
            if x == 0 {
                return 0
            } else if x == 1 {
                return 1
            } else if x == 2 {
                return 2
            }
        } else if y == 1 {
            if x == 0 {
                return 3
            } else if x == 1 {
                return 4
            } else if x == 2 {
                return 5
            }
        } else if y == 2 {
            if x == 0 {
                return 6
            } else if x == 1 {
                return 7
            } else if x == 2 {
                return 8
            }
        }
        return -1
    }
    
    func doesCellHaveValue(x: Int, y: Int)-> Bool {
        if y == 0 {
            if x == 0 {
                if boardCells[0].value != 0 { return true }
            } else if x == 1 {
                if boardCells[1].value != 0 { return true }
            } else if x == 2 {
                if boardCells[2].value != 0 { return true }
            } 
        } else if y == 1 {
            if x == 0 {
                if boardCells[3].value != 0 { return true }
            } else if x == 1 {
                if boardCells[4].value != 0 { return true }
            } else if x == 2 {
                if boardCells[5].value != 0 { return true }
            }
        } else if y == 2 {
            if x == 0 {
                if boardCells[6].value != 0 { return true }
            } else if x == 1 {
                if boardCells[7].value != 0 { return true }
            } else if x == 2 {
                if boardCells[8].value != 0 { return true }
            }
        }
        return false
    }
    
    func checkForEmptyCells()-> Array<Cell> {
        var emptyCells: Array<Cell> = []
        for c in boardCells {
            if c.value == 0 {
                emptyCells.append(c)
            }
        }
        return emptyCells
    }
    
    func changeValueXY(x: Int, y: Int) {
        if y == 0 {
            if x == 0 {
                boardCells[0].value = currentPlayer
            } else if x == 1 {
                boardCells[1].value = currentPlayer
            } else if x == 2 {
                boardCells[2].value = currentPlayer
            }
        } else if y == 1 {
            if x == 0 {
                boardCells[3].value = currentPlayer
            } else if x == 1 {
                boardCells[4].value = currentPlayer
            } else if x == 2 {
                boardCells[5].value = currentPlayer
            }
        } else if y == 2 {
            if x == 0 {
                boardCells[6].value = currentPlayer
            } else if x == 1 {
                boardCells[7].value = currentPlayer
            } else if x == 2 {
                boardCells[8].value = currentPlayer
            }
        }
        endTurn()
        
    }
    
    func endTurn() {
        let c = checkForWinner()
        if c != -1 {
            winner = c
        } else {
            if checkForTie() {
                winner = 3
            }
        }
        swapPlayer()
    }
    
    func resetBoard() {
        for i in 0...8  {
            boardCells[i].value = 0
        }
        winner = 0
        currentPlayer = 1
    }
    
    func checkForWinner()-> Int {
        var exitValue: Int = 0

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
        if exitValue != 0 {
            return exitValue
        } else {
            return -1
        }
    }
    
    func checkForTie()-> Bool {
        var output: Int = 0
        if checkForWinner() == -1 {
            for i in 0...8 {
                if boardCells[i].value != 0 {
                    output += 1
                }
            }
        }
        if output == 9 {
            return true
        } else {
            return false
        }
    }
    
    var description: String {
        return "\(boardCells)"
    }
    
}





