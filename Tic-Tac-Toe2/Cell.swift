//
//  Cell.swift
//  Tic-Tac-Toe2
//
//  Created by Harrison Wong on 1/09/2017.
//  Copyright © 2017 Harrison Wong. All rights reserved.
//

// 0 = blank; 1 = red; 2 = blue

import Foundation

func ==(left: Cell, right: Cell)-> Bool {
    if left.value == right.value {
        return true
    } else {
        return false
    }
}

struct Cell : CustomStringConvertible, Hashable {
    
    var value: Int
    var hashValue: Int {
        get {
            return value
        }
    }
    
    init (value: Int) {
        self.value = value
    }
    
    func getData()-> Int {
        return value
    }
    
    var description: String {
        return "\(value)"
    }
    
}
