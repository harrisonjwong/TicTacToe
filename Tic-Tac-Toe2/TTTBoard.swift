//
//  TTTBoard.swift
//  Tic-Tac-Toe2
//
//  Created by Harrison Wong on 1/09/2017.
//  Copyright © 2017 Harrison Wong. All rights reserved.
//

import Foundation

class TTTBoard {
    
    var topLeft = Cell(value: 0) {
        didSet {
            checkForWinner()
        }
    }
    var topMiddle = Cell(value: 0)
    var topRight = Cell(value: 0)
    var middleLeft = Cell(value: 0)
    var middleMiddle = Cell(value: 0)
    var middleRight = Cell(value: 0)
    var bottomLeft = Cell(value: 0)
    var bottomMiddle = Cell(value: 0)
    var bottomRight = Cell(value: 0)
    
    func checkForWinner()-> Int {
        var exitValue: Int? = nil
        if topLeft.value == topMiddle.value && topMiddle.value == topRight.value {
            exitValue = topMiddle.value
        }
        if middleLeft.value == middleMiddle.value && middleMiddle.value == middleRight.value {
            exitValue =  middleMiddle.value
        }
        if bottomLeft.value == bottomMiddle.value && bottomMiddle.value == bottomRight.value {
            exitValue = bottomMiddle.value
        }
        if topLeft.value == middleLeft.value && middleLeft.value == bottomLeft.value {
            exitValue =  middleLeft.value
        }
        if topMiddle.value == middleMiddle.value && middleMiddle.value == bottomMiddle.value {
            exitValue = middleMiddle.value
        }
        if topRight.value == middleRight.value && middleRight.value == bottomRight.value {
            exitValue = middleRight.value
        }
        if topLeft.value == middleMiddle.value && middleMiddle.value == bottomRight.value {
            exitValue =  middleMiddle.value
        }
        if topRight.value == middleMiddle.value && middleMiddle.value == bottomLeft.value {
            exitValue =  middleMiddle.value
        }
        if exitValue != nil {
            return exitValue!
        } else {
            return -1
        }
    }
    
    
}
