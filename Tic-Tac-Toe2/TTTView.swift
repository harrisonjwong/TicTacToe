//
//  TTTView.swift
//  Tic-Tac-Toe2
//
//  Created by Harrison Wong on 1/09/2017.
//  Copyright © 2017 Harrison Wong. All rights reserved.
//

import UIKit

struct Line {
    var begin = CGPoint.zero
    var end = CGPoint.zero
}

class TTTView : UIView {
    
    var board: TTTBoard!
    var border = CGRect()
    var dimensions: CGFloat = 3
    
    func strokeLine(_ line: Line) {
        let path = UIBezierPath()
        path.lineWidth = 3
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
        strokeLine(l)
        //up-down right
        l.begin = CGPoint(x: 575.33, y: 117)
        l.end = CGPoint(x: 575.33, y: 617)
        strokeLine(l)
        //left-right upper
        l.begin = CGPoint(x: 242, y: 283.67)
        l.end = CGPoint(x: 742, y: 283.67)
        strokeLine(l)
        //left-right lower
        l.begin = CGPoint(x: 242, y: 450.33)
        l.end = CGPoint(x: 742, y: 450.33)
        strokeLine(l)
        
        border = makeFrame(rect)
        let borderPath = UIBezierPath(rect: border)
        borderPath.stroke()
    }
    
    func makeFrame(_ rect: CGRect) -> CGRect {
        let rectangle = CGRect(x: 242, y: 117, width: 500, height: 500)
        let r = rectangle.insetBy(dx: 0, dy: 0)
        return r
    }
    
}

