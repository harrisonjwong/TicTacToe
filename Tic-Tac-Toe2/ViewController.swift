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
    
    var board = TTTBoard()
    @IBOutlet var tttView: TTTView!
    
    var isGameOver: Bool = false
    
    @IBAction func resetGame(_ sender: Any) {
        board.resetBoard()
        self.tttView.updateGraphic()
        isGameOver = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureView() {
        if let view = self.tttView {
            view.board = self.board
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print(#function)
        if isGameOver != true {
            
            let touch = touches.first!
            
            let location = touch.location(in: tttView)
            
            if tttView.makeFrame(tttView.bounds).contains(location) {
                if tttView.board.doesCellHaveValue(x: tttView.convertPixelToCoorX(location.x), y: tttView.convertPixelToCoorY(location.y)) {
                    
                    tttView.graphicEdit = false
                } else {
                    tttView.addCell(tttView.convertPixelToCoorX(location.x), yCoor: tttView.convertPixelToCoorY(location.y))
                    tttView.graphicEdit = true
                }
                tttView.setNeedsDisplay()
            }
//            print(board)
            if board.winner != 0 {
                var title: String = ""
                if board.winner == 1 {
                    title = "Player 1 wins!"
                } else if board.winner == 2 {
                    title = "Player 2 wins!"
                } else if board.winner == 3 {
                    title = "Tie game!"
                }
                let ac = UIAlertController(title: title, message: "", preferredStyle: UIAlertControllerStyle.alert)
                let seeBoardAction = UIAlertAction(title: "See Board", style: .cancel,
                                                   handler: { (action) -> Void in
                                                    self.isGameOver = true
                })
                ac.addAction(seeBoardAction)
                let resetAction = UIAlertAction(title: "Reset Game", style: .destructive,
                                                handler: { (action) -> Void in
                                                    self.board.resetBoard()
                                                    self.tttView.updateGraphic() })
                ac.addAction(resetAction)
                self.present(ac, animated: true, completion: nil)
                
            }
        }
        
    }
    
    
}


