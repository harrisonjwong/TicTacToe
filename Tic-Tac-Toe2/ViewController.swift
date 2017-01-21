//
//  ViewController.swift
//  Tic-Tac-Toe2
//
//  Created by Harrison Wong on 1/09/2017.
//  Copyright © 2017 Harrison Wong. All rights reserved.
//

// Handles touches and calculations

import UIKit

class ViewController: UIViewController {
    
    var board: TTTBoard!
    var tttView: TTTView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if board != nil {
//            
//            let touch = touches.first!
//            
//            let location = touch.location(in: tttView)
//            
//            if tttView.makeFrame(tttView.bounds).contains(location) {
//                if tttView.board.doesCellHaveValue(c: <#T##Cell#>)(Cell(xCoor: colonyView.convertPixelToCoorX(location.x), yCoor: colonyView.convertPixelToCoorY(location.y))) {
//                    recentCellLabel = colonyView.removeCell(colonyView.convertPixelToCoorX(location.x), yCoor: colonyView.convertPixelToCoorY(location.y))
//                    
//                    colonyView.graphicEdit = false
//                } else {
//                    recentCellLabel = colonyView.addCell(colonyView.convertPixelToCoorX(location.x), yCoor: colonyView.convertPixelToCoorY(location.y))
//                    colonyView.graphicEdit = true
//                }
//            }
//            colonyView.setNeedsDisplay()
//        }
//    }
//   
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if detailItem != nil {
//            let touch = touches.first!
//            
//            let location = touch.location(in: colonyView)
//            
//            var recentCellLabel = ""
//            
//            if colonyView.makeFrame(colonyView.bounds).contains(location) {
//                if !colonyView.graphicEdit {
//                    recentCellLabel = colonyView.removeCell(colonyView.convertPixelToCoorX(location.x), yCoor: colonyView.convertPixelToCoorY(location.y))
//                } else {
//                    recentCellLabel = colonyView.addCell(colonyView.convertPixelToCoorX(location.x), yCoor: colonyView.convertPixelToCoorY(location.y))
//                }
//            }
//            if recentCellLabel == "" {
//                coorLabel.text = "(-1, -1)"
//            } else {
//                coorLabel.text = recentCellLabel
//            }
//            colonyView.setNeedsDisplay()
//        }
//    }
//    
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if detailItem != nil {
//            colonyView.graphicEdit = true
//        }
//    }

    
}

