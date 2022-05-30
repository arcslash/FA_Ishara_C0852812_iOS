//
//  ViewController.swift
//  FA_Ishara_C0852812_iOS
//
//  Created by Ishara Abeykoon on 2022-05-30.
//


import UIKit

class ViewController: UIViewController
{
    let coreDataController: CoreDataController = CoreDataController()
    let currentBoardState: Board = Board(a1: 0, a2: 0, a3: 0, b1: 0, b2: 0, b3: 0, c1: 0, c2: 0, c3: 0, currentTurnOwnPlayerId: 0)
    let currentPlayerScore: Player = Player(playerOneScore: 0, playerTwoScore: 0)
    enum Turn {
        case Nought
        case Cross
    }
    
    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var a1: UIButton!
    @IBOutlet weak var a2: UIButton!
    @IBOutlet weak var a3: UIButton!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var c1: UIButton!
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c3: UIButton!
    
    var firstTurn = Turn.Cross
    var currentTurn = Turn.Cross
    
    var NOUGHT = "O"
    var CROSS = "X"
    var board = [UIButton]()
    
    var noughtsScore = 0
    var crossesScore = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        initBoard()
        initBoardAndPlayerScores()
    }
    
    func initBoard()
    {
        
        board.append(a1)
        board.append(a2)
        board.append(a3)
        board.append(b1)
        board.append(b2)
        board.append(b3)
        board.append(c1)
        board.append(c2)
        board.append(c3)
    }
    
    // Init board in case of close back and open
    func initBoardAndPlayerScores(){
        var currentBoardState: Board = coreDataController.getLastBoardState()
        var currentPlayerScore: Player = coreDataController.getPlayerState()
        
        noughtsScore = currentPlayerScore.playerOneScore
        noughtsScore = currentPlayerScore.playerTwoScore
        print("locading current board:", currentBoardState.viewCurrentBoard())
        let boardMap = currentBoardState.viewCurrentBoardMap()
        
        // Update Board
        for (index, square) in currentBoardState.viewCurrentBoard().enumerated(){
            if(square == 1){
                convertToSender(sender: boardMap[index]).setTitle(NOUGHT, for: .normal)
            }else if(square == 2){
                convertToSender(sender: boardMap[index]).setTitle(CROSS, for: .normal)
            }
            
        }
        
    }
    
    func updateBoard(checkedBoxAddress: String, checkedBoxPlayer: ViewController.Turn){
        // noghets - 1
        // crosses - 2
        var squareValue = 0
        if(checkedBoxPlayer == Turn.Nought){
            squareValue = 1
        }
        if(checkedBoxPlayer == Turn.Cross){
            squareValue = 2
        }
        currentBoardState.updateSquare(squareAddress: checkedBoxAddress, squareValue: squareValue)
        print(currentBoardState.viewCurrentBoard())
        
    }

    @IBAction func boardTapAction(_ sender: UIButton)
    {
        addToBoard(sender)
        
        if checkForVictory(CROSS)
        {
            crossesScore += 1
            resultAlert(title: "Crosses Win!")
        }
        
        if checkForVictory(NOUGHT)
        {
            noughtsScore += 1
            resultAlert(title: "Noughts Win!")
        }
        
        if(fullBoard())
        {
            resultAlert(title: "Draw")
        }
    }
    
    func checkForVictory(_ s :String) -> Bool
    {
        // Horizontal Victory
        if thisSymbol(a1, s) && thisSymbol(a2, s) && thisSymbol(a3, s)
        {
            return true
        }
        if thisSymbol(b1, s) && thisSymbol(b2, s) && thisSymbol(b3, s)
        {
            return true
        }
        if thisSymbol(c1, s) && thisSymbol(c2, s) && thisSymbol(c3, s)
        {
            return true
        }
        
        // Vertical Victory
        if thisSymbol(a1, s) && thisSymbol(b1, s) && thisSymbol(c1, s)
        {
            return true
        }
        if thisSymbol(a2, s) && thisSymbol(b2, s) && thisSymbol(c2, s)
        {
            return true
        }
        if thisSymbol(a3, s) && thisSymbol(b3, s) && thisSymbol(c3, s)
        {
            return true
        }
        
        // Diagonal Victory
        if thisSymbol(a1, s) && thisSymbol(b2, s) && thisSymbol(c3, s)
        {
            return true
        }
        if thisSymbol(a3, s) && thisSymbol(b2, s) && thisSymbol(c1, s)
        {
            return true
        }
        
        return false
    }
    
    func thisSymbol(_ button: UIButton, _ symbol: String) -> Bool
    {
        return button.title(for: .normal) == symbol
    }
    
    func resultAlert(title: String)
    {
        let message = "\nNoughts " + String(noughtsScore) + "\n\nCrosses " + String(crossesScore)
        let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Reset", style: .default, handler: { (_) in
            self.resetBoard()
        }))
        self.present(ac, animated: true)
    }
    
    func resetBoard()
    {
        for button in board
        {
            button.setTitle(nil, for: .normal)
            button.isEnabled = true
        }
        if firstTurn == Turn.Nought
        {
            firstTurn = Turn.Cross
            turnLabel.text = CROSS
        }
        else if firstTurn == Turn.Cross
        {
            firstTurn = Turn.Nought
            turnLabel.text = NOUGHT
        }
        currentTurn = firstTurn
    }
    
    func fullBoard() -> Bool
    {
        for button in board
        {
            if button.title(for: .normal) == nil
            {
                return false
            }
        }
        return true
    }
    
    func recognizeSender(sender: UIButton) -> String{
        if(sender == a1){
            return "a1"
        }else if(sender == a2){
            return "a2"
        }else if(sender == a3){
            return "a3"
        }else if(sender == b1){
            return "b1"
        }else if(sender == b2){
            return "b2"
        }else if(sender == b3){
            return "b3"
        }else if(sender == c1){
            return "c1"
        }else if(sender == c2){
            return "c2"
        }else if(sender == c3){
            return "c3"
        }
        return "d1"
    }
    
    func convertToSender(sender: String) -> UIButton{
        if(sender == "a1"){
            return a1
        }else if(sender == "a2"){
            return a2
        }else if(sender == "a3"){
            return a3
        }else if(sender == "b1"){
            return b1
        }else if(sender == "b2"){
            return b2
        }else if(sender == "b3"){
            return b3
        }else if(sender == "c1"){
            return c1
        }else if(sender == "c2"){
            return c2
        }else if(sender == "c3"){
            return c3
        }
        return a1
    }
    
    func addToBoard(_ sender: UIButton)
    {
        if(sender.title(for: .normal) == nil)
        {
            if(currentTurn == Turn.Nought)
            {
                
                updateBoard(checkedBoxAddress: recognizeSender(sender: sender), checkedBoxPlayer: Turn.Nought)
                sender.setTitle(NOUGHT, for: .normal)
                currentTurn = Turn.Cross
                turnLabel.text = CROSS
            }
            else if(currentTurn == Turn.Cross)
            {
                updateBoard(checkedBoxAddress:recognizeSender(sender: sender), checkedBoxPlayer: Turn.Cross)
                sender.setTitle(CROSS, for: .normal)
                currentTurn = Turn.Nought
                turnLabel.text = NOUGHT
            }
            sender.isEnabled = false
        }
    }
    
}


