//
//  CoreDataController.swift
//  FA_Ishara_C0852812_iOS
//
//  Created by Ishara Abeykoon on 2022-05-30.
//

import UIKit
import CoreData


class CoreDataController{
    func storeSquareStates(currentBoardStates: Board){
        clearBoardStates()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext

        let currentBoardState = NSEntityDescription.insertNewObject(forEntityName: "BoardModel", into: context)
        currentBoardState.setValue(currentBoardStates.boardStates, forKey: "squareStates")
        do {
            try context.save()
        } catch {
            print(error)
        }
        
    }
    func storePlayerStates(playerScores: Player){
        clearPlayerStates()
        print("Player1 scores:", playerScores.playerOneScore)
        print("Player2 scores:", playerScores.playerTwoScore)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let currentPlayersState = NSEntityDescription.insertNewObject(forEntityName: "PlayerModel", into: context)
        currentPlayersState.setValue(playerScores.playerOneScore, forKey: "playerOneScore")
        currentPlayersState.setValue(playerScores.playerTwoScore, forKey: "playerTwoScore")
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
    func getSquareStates() -> Board{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "BoardModel")
        do {
            let results = try context.fetch(request)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    let boardSquareStates: [Int] = result.value(forKey: "squareStates") as! [Int]
                    let boardState : Board = Board(boardStates: boardSquareStates)
                    return boardState
                }
            }
        } catch {
            print(error)
        }
        return Board(boardStates: [0, 0, 0, 0, 0, 0, 0, 0, 0])
    }
    func getPlayerStates() -> Player{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "PlayerModel")
        do {
            let results = try context.fetch(request)
            if results.count > 0 {
                
                for result in results as! [NSManagedObject] {
                    let player1_score: Int = result.value(forKey: "playerOneScore") as! Int,
                        player2_score: Int = result.value(forKey: "playerTwoScore") as! Int
                    let playerState : Player = Player(
                        playerOneScore: player1_score, playerTwoScore: player2_score
                    )
                    print(" value1 found:",player1_score )
                    print(" value2 found:",player2_score )
                    return playerState
                    
                }
            }
        } catch {
            print(error)
        }
        print("No values found ")
        return Player(playerOneScore: 0, playerTwoScore: 0)
    }
    
    func clearBoardStates(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "BoardModel")
        do {
            let results = try context.fetch(request)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                        context.delete(result)
                }
            }
        } catch {
            print(error)
        }
    }
    func clearPlayerStates(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "PlayerModel")
        do {
            let results = try context.fetch(request)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    context.delete(result)
                }
            }
        } catch {
            print(error)
        }
    }
}
