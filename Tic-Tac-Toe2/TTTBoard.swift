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
    
    var tournamentMode: Bool = false
    var winsP1 = 0
    var winsP2 = 0
    var totalGames: Int = 1
    var totalGamesNecessaryToWin: Int {
        return Int(round(Double(totalGames/2)) + 1)
    }
    var tournamentWin: Int = 0
    var currentGame: Int = 1
    
    func resetTournament() {
        currentGame = 1
        winsP1 = 0
        winsP2 = 0
        totalGames = 1
        tournamentWin = 0
    }
    
    var expertMode: Bool = false
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
        if tournamentMode == false {
            let c = checkForWinner()
            if c != -1 {
                winner = c
            } else {
                if checkForTie() {
                    winner = 3
                }
            }
            swapPlayer()
        } else if tournamentMode == true {
            let c = checkForWinner()
            if c != -1 && c != 3 {
                winner = c
                currentGame += 1
                if winner == 1 {
                    winsP1 += 1
                } else if winner == 2 {
                    winsP2 += 1
                }
            } else {
                if checkForTie() {
                    winner = 3
                }
            }
            if winsP1 == totalGamesNecessaryToWin {
                tournamentWin = 1
            } else if winsP2 == totalGamesNecessaryToWin {
                tournamentWin = 2
            }
            swapPlayer()
        }
    }
    
    func resetBoard() {
        for i in 0...8  {
            boardCells[i].value = 0
        }
        winner = 0
        currentPlayer = 1
    }
    
    func checkForWinnerHelper(a: Int, b: Int, c: Int)-> Int{
        if boardCells[a].value != 0 && boardCells[b].value != 0 && boardCells[c].value != 0 && boardCells[a].value == boardCells[b].value && boardCells[b].value == boardCells[c].value && boardCells[a].value == boardCells[c].value {
            return boardCells[b].value
        } else {
            return 0
        }
    }
    
    func checkForWinner()-> Int {
        var exitValue: Int = 0
        
        exitValue = checkForWinnerHelper(a: 0, b: 1, c: 2)
        if exitValue != 0 {
            return exitValue
        }
        exitValue = checkForWinnerHelper(a: 3, b: 4, c: 5)
        if exitValue != 0 {
            return exitValue
        }
        exitValue = checkForWinnerHelper(a: 6, b: 7, c: 8)
        if exitValue != 0 {
            return exitValue
        }
        exitValue = checkForWinnerHelper(a: 0, b: 3, c: 6)
        if exitValue != 0 {
            return exitValue
        }
        exitValue = checkForWinnerHelper(a: 1, b: 4, c: 7)
        if exitValue != 0 {
            return exitValue
        }
        exitValue = checkForWinnerHelper(a: 2, b: 5, c: 8)
        if exitValue != 0 {
            return exitValue
        }
        exitValue = checkForWinnerHelper(a: 0, b: 4, c: 8)
        if exitValue != 0 {
            return exitValue
        }
        exitValue = checkForWinnerHelper(a: 2, b: 4, c: 6)
        if exitValue != 0 {
            return exitValue
        }
        return -1

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





