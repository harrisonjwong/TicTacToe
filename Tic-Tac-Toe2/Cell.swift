//
//  Cell.swift
//  Tic-Tac-Toe2
//
//  Created by Harrison Wong on 1/09/2017.
//  Copyright © 2017 Harrison Wong. All rights reserved.
//

// 0 = blank; 1 = X; 2 = O

import Foundation

func ==(left: Cell, right: Cell)-> Bool {
    if left.value == right.value {
        return true
    } else {
        return false
    }
}

struct Cell : CustomStringConvertible, Hashable {
    
    var x: Int
    var y: Int
    var value: Int = 0
    var hashValue: Int {
        get {
            return value
        }
    }
    
    init (x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    func getValue()-> Int {
        return value
    }
    
    var description: String {
        return "\(value)"
    }
    
}
