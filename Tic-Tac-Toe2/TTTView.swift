//
//  TTTView.swift
//  Tic-Tac-Toe2
//
//  Created by Harrison Wong on 1/09/2017.
//  Copyright © 2017 Harrison Wong. All rights reserved.
//

import UIKit
import CoreGraphics

struct Line {
    var begin = CGPoint.zero
    var end = CGPoint.zero
}

class TTTView : UIView {
    
    
    var board: TTTBoard!
    var border = CGRect()
    var dimensions: CGFloat = 3
    var graphicCells1 = [CGRect]()
    var graphicCells2 = [CGRect]()
    var graphicEdit: Bool = true //true means adding, false means do nothing

    
    func strokeLine(_ line: Line, width: CGFloat) {
        let path = UIBezierPath()
        path.lineWidth = width
        path.lineCapStyle = CGLineCap.round
        path.move(to: line.begin)
        path.addLine(to: line.end)
        path.stroke()
    }
    
    override func draw(_ rect: CGRect) {
        
        var l = Line()
        UIColor.black.setStroke()
        //up-down left
        l.begin = CGPoint(x: 408.67, y: 117)
        l.end = CGPoint(x: 408.67, y: 617)
        strokeLine(l, width: 4)
        //up-down right
        l.begin = CGPoint(x: 575.33, y: 117)
        l.end = CGPoint(x: 575.33, y: 617)
        strokeLine(l, width: 4)
        //left-right upper
        l.begin = CGPoint(x: 242, y: 283.67)
        l.end = CGPoint(x: 742, y: 283.67)
        strokeLine(l, width: 4)
        //left-right lower
        l.begin = CGPoint(x: 242, y: 450.33)
        l.end = CGPoint(x: 742, y: 450.33)
        strokeLine(l, width: 4)
        
        border = makeFrame(rect)
        
        UIColor.red.setStroke()
        for cells in graphicCells1 {
            strokeX(cells)
        }
        
        UIColor.blue.setStroke()
        for cells in graphicCells2 {
            strokeCircle(cells)
        }
    }
    
    func strokeX(_ c: CGRect) {
        let rekt = c.insetBy(dx: 25, dy: 25)
        var l = Line()
        l.begin = CGPoint(x: rekt.minX, y: rekt.minY)
        l.end = CGPoint(x: rekt.maxX, y: rekt.maxY)
        strokeLine(l, width: 3)
        l.begin = CGPoint(x: rekt.minX, y: rekt.maxY)
        l.end = CGPoint(x: rekt.maxX, y: rekt.minY)
        strokeLine(l, width: 3)

    }
    
    func strokeCircle(_ c: CGRect) {
        let rekt = c.insetBy(dx: 25, dy: 25)
        let path = UIBezierPath(ovalIn: rekt)
        path.lineWidth = 3
        path.lineCapStyle = CGLineCap.round
        path.stroke()
    }
    
    func updateGraphic() {
        graphicCells1 = []
        graphicCells2 = []
        for cell in board.boardCells {
            if cell.value != 0 {
                addCell(cell.x, yCoor: cell.y)
            }
        }
        setNeedsDisplay()   //updates it after evolving
    }
    
    func makeFrame(_ rect: CGRect) -> CGRect {
        let rectangle = CGRect(x: 242, y: 117, width: 500, height: 500)
        let r = rectangle.insetBy(dx: 0, dy: 0)
        return r
    }
    
    func convertPixelToCoorX(_ x: CGFloat) -> Int {
        return Int(floor((x - makeFrame(bounds).minX)/(makeFrame(bounds).width/3)))
    }
    
    func convertPixelToCoorY(_ y: CGFloat) -> Int {
        return Int(floor((y - makeFrame(bounds).minY)/(makeFrame(bounds).height/3)))
    }
    
    func convertCoorToGridX(_ x: Int) -> CGFloat {
        return makeFrame(bounds).minX + CGFloat(x)*(makeFrame(bounds).width/dimensions)
    }
    
    func convertCoorToGridY(_ y: Int) -> CGFloat {
        return makeFrame(bounds).minY + CGFloat(y)*(makeFrame(bounds).height/dimensions)
    }
    
    func addCellHelper(xCoor: Int, yCoor: Int) {
        let aCell = CGRect(x: convertCoorToGridX(xCoor), y: convertCoorToGridY(yCoor), width: makeFrame(bounds).width/dimensions, height: makeFrame(bounds).height/dimensions)
        if board.currentPlayer == 1 {
            board.changeValueXY(x: xCoor, y: yCoor)
            graphicCells1.append(aCell)
        } else if board.currentPlayer == 2 {
            board.changeValueXY(x: xCoor, y: yCoor)
            graphicCells2.append(aCell)
        }
    }
    
    func addCell(_ xCoor: Int, yCoor: Int) {
        var empty = [Int]()
        if board.expertMode == false {
            addCellHelper(xCoor: xCoor, yCoor: yCoor)
        } else if board.expertMode == true {
            let chance = Int(arc4random_uniform(UInt32(10)))
            if chance == 0 || chance == 1 || chance == 2 {
                empty.removeAll()
                for i in 0...8 {     // for each cell
                    if board.boardCells[i].value == 0 {  //if it's empty
                        let x = board.sendMatchingCellIndex(x: xCoor, y: yCoor)
                        if i != x {
                            empty.append(i) // add the index to the empty array
                        }
                    }
                }
                if empty.isEmpty == false {
                    let randIndex = Int(arc4random_uniform(UInt32(empty.count))) //random index of indexes array
                    let chosenCell = board.boardCells[empty[randIndex]]
                    addCellHelper(xCoor: chosenCell.x, yCoor: chosenCell.y)
                } else {
                    addCellHelper(xCoor: xCoor, yCoor: yCoor)
                }
            } else {
                addCellHelper(xCoor: xCoor, yCoor: yCoor)
            }
        }
    }

}
