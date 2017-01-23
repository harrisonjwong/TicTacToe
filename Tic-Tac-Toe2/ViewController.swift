//
//  ViewController.swift
//  Tic-Tac-Toe2
//
//  Created by Harrison Wong on 1/09/2017.
//  Copyright © 2017 Harrison Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var board = TTTBoard()
    var isGameOver: Bool = false
    
    @IBOutlet var tttView: TTTView!
    @IBOutlet var expertModeSwitch: UISwitch!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var tournamentModeSwitch: UISwitch!
    @IBOutlet var gameNumberLabel: UILabel!
    @IBOutlet var nightModeSwitch: UISwitch!
    @IBOutlet var outsideView: UIView!
    @IBOutlet var turnLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func stateChanged(_ switchState: UISwitch) {
        if switchState.isOn {
            tttView.board.expertMode = true
        } else {
            tttView.board.expertMode = false
        }
    }
    
    func stateChangedNightMode(_ switchState: UISwitch) {
        if switchState.isOn {
            tttView.nightMode = true
            outsideView.backgroundColor = UIColor.gray
            tttView.updateGraphic()
        } else {
            tttView.nightMode = false
            outsideView.backgroundColor = UIColor.white
            tttView.updateGraphic()
        }
    }
    
    func stateChangedTournament(_ switchState: UISwitch) {
        if switchState.isOn {
            tttView.board.tournamentMode = true
            tttView.board.resetBoard()
            tttView.board.resetTournament()
            tttView.updateGraphic()
            turnLabel.text = "Player \(board.currentPlayer)'s Turn"
            isGameOver = false
            let alert = UIAlertController(title: "Choose Number of Games", message: "Odd numbers only", preferredStyle: UIAlertControllerStyle.alert)
            
            let saveAction = UIAlertAction(title: "Save", style: .default, handler: { (action: UIAlertAction!) in
                
                let textField = alert.textFields![0] as UITextField
                textField.keyboardType = UIKeyboardType.numberPad
                
                let games = Int(textField.text!)
                if games != nil && games! % 2 != 0 && games! >= 1 {
                    self.tttView.board.totalGames = games!
                } else {
                    self.tttView.board.totalGames = 1
                }
                self.gameNumberLabel.text = "Game \(self.tttView.board.currentGame) of \(self.tttView.board.totalGames)"
                self.scoreLabel.text = "Score: P1 \(self.tttView.board.winsP1)-\(self.tttView.board.winsP2) P2"
            })
            
            alert.addTextField { (textField: UITextField!) in
                textField.keyboardType = UIKeyboardType.numberPad
            }
            alert.addAction(saveAction)
            
            self.present(alert, animated: true, completion: nil)
        } else {
            tttView.board.tournamentMode = false
            gameNumberLabel.text = ""
            tttView.board.resetBoard()
            turnLabel.text = "Player \(board.currentPlayer)'s Turn"
            tttView.updateGraphic()
            scoreLabel.text = ""
        }
    }
    
    @IBAction func resetGame(_ sender: Any) {
        tttView.board.resetBoard()
        turnLabel.text = "Player \(board.currentPlayer)'s Turn"
        self.tttView.updateGraphic()
        isGameOver = false
    }
    
    func configureView() {
        if let view = self.tttView {
            view.board = self.board
            expertModeSwitch.addTarget(self, action: #selector(ViewController.stateChanged(_:)), for: UIControlEvents.valueChanged)
            tournamentModeSwitch.addTarget(self, action: #selector(ViewController.stateChangedTournament(_:)), for: UIControlEvents.valueChanged)
            nightModeSwitch.addTarget(self, action: #selector(ViewController.stateChangedNightMode(_:)), for: UIControlEvents.valueChanged)
            turnLabel.text = "Player \(board.currentPlayer)'s Turn"
            
            if board.tournamentMode == false {
                gameNumberLabel.text = ""
                
                
            } else if board.tournamentMode == true {


            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
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
            turnLabel.text = "Player \(board.currentPlayer)'s Turn"
            self.board = tttView.board
            if board.tournamentMode == false {
                gameNumberLabel.text = ""
                scoreLabel.text = ""

                if board.winner != 0 {
                    var title: String = ""
                    turnLabel.text = ""
                    if board.winner == 1 {
                        title = "Player 1 wins!"
                    } else if board.winner == 2 {
                        title = "Player 2 wins!"
                    } else if board.winner == 3 {
                        title = "Tie game!"
                    }
                    turnLabel.text = ""
                    let ac = UIAlertController(title: title, message: "", preferredStyle: UIAlertControllerStyle.alert)
                    let seeBoardAction = UIAlertAction(title: "See Board", style: .cancel,
                                                       handler: { (action) -> Void in
                                                        self.isGameOver = true
                                                        self.turnLabel.text = ""})
                    ac.addAction(seeBoardAction)
                    let resetAction = UIAlertAction(title: "Reset Game", style: .destructive,
                                                    handler: { (action) -> Void in
                                                        self.board.resetBoard()
                                                        self.tttView.updateGraphic()
                                                        self.turnLabel.text = "Player \(self.tttView.board.currentPlayer)'s Turn"})
                    ac.addAction(resetAction)
                    self.present(ac, animated: true, completion: nil)
                    
                }
                
            } else if board.tournamentMode == true {
                gameNumberLabel.text = "Game \(tttView.board.currentGame) of \(tttView.board.totalGames)"
                scoreLabel.text = "Score: P1 \(tttView.board.winsP1)-\(tttView.board.winsP2) P2"
                if board.winner != 0 {
                    var title: String = ""
                    var message: String = ""
                    if board.tournamentWin == 0 {
                        message = "Score: P1 \(board.winsP1)-\(board.winsP2) P2"
                        if board.winner == 1 {
                            title = "Player 1 wins!"
                        } else if board.winner == 2 {
                            title = "Player 2 wins!"
                        } else if board.winner == 3 {
                            title = "Tie game!"
                        }
                        self.turnLabel.text = ""
                        self.gameNumberLabel.text = ""
                        let ac = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
                        let resetAction = UIAlertAction(title: "Reset Game", style: .destructive,
                                                        handler: { (action) -> Void in
                                                            self.board.resetBoard()
                                                            self.tttView.updateGraphic()
                                                            self.gameNumberLabel.text = "Game \(self.tttView.board.currentGame) of \(self.tttView.board.totalGames)"
                                                            self.scoreLabel.text = "Score: P1 \(self.tttView.board.winsP1)-\(self.tttView.board.winsP2) P2"
                                                            self.turnLabel.text = "Player \(self.tttView.board.currentPlayer)'s Turn"})
                        ac.addAction(resetAction)
                        self.present(ac, animated: true, completion: nil)
                    } else if board.tournamentWin == 1 || board.tournamentWin == 2{
                        self.gameNumberLabel.text = ""
                        self.turnLabel.text = ""
                        title = "Player \(board.tournamentWin) wins tournament!"
                        message = "Final Score: P1 \(board.winsP1)-\(board.winsP2) P2"
                        let ac = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
                        let resetAction = UIAlertAction(title: "Reset Tournament", style: .destructive,
                                                        handler: { (action) -> Void in
                                                            self.board.resetBoard()
                                                            self.tttView.updateGraphic()
                                                            self.board.winsP1 = 0
                                                            self.board.winsP2 = 0
                                                            self.board.tournamentWin = 0
                                                            self.board.currentGame = 1
                                                            self.gameNumberLabel.text = "Game \(self.tttView.board.currentGame) of \(self.tttView.board.totalGames)"
                                                            self.scoreLabel.text = "Score: P1 \(self.tttView.board.winsP1)-\(self.tttView.board.winsP2) P2"
                                                            self.turnLabel.text = "Player \(self.tttView.board.currentPlayer)'s Turn" })
                        ac.addAction(resetAction)
                        self.present(ac, animated: true, completion: nil)
                    }


                }
            }
        }
        
    }
    
    
}


