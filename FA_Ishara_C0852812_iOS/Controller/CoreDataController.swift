//
//  CoreDataController.swift
//  FA_Ishara_C0852812_iOS
//
//  Created by Ishara Abeykoon on 2022-05-30.
//

import UIKit
import CoreData


class CoreDataController{
    
    func addBoardState(currentBoardPlacements: Board){
        // check if there's already an state - if so delete it
        clearBoardStates()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let currentBoardState = NSEntityDescription.insertNewObject(forEntityName: "BoardModel", into: context)
        currentBoardState.setValue(currentBoardPlacements.a1, forKey: "a1")
        currentBoardState.setValue(currentBoardPlacements.a2, forKey: "a2")
        currentBoardState.setValue(currentBoardPlacements.a3, forKey: "a3")
        currentBoardState.setValue(currentBoardPlacements.b1, forKey: "b1")
        currentBoardState.setValue(currentBoardPlacements.b2, forKey: "b2")
        currentBoardState.setValue(currentBoardPlacements.b3, forKey: "b3")
        currentBoardState.setValue(currentBoardPlacements.c1, forKey: "c1")
        currentBoardState.setValue(currentBoardPlacements.c2, forKey: "c2")
        currentBoardState.setValue(currentBoardPlacements.c3, forKey: "c3")
        currentBoardState.setValue(currentBoardPlacements.currentTurnOwnPlayerId, forKey: "currentTurnOwnPlayerId")
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
    func addPlayerState(currentPlayerScoreStates: Player){
        
         
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        // check if there's already an state - if so delete it
        
        
        
        let currentPlayersState = NSEntityDescription.insertNewObject(forEntityName: "PlayerModel", into: context)
        currentPlayersState.setValue(currentPlayerScoreStates.playerOneScore, forKey: "playerOneScore")
        currentPlayersState.setValue(currentPlayerScoreStates.playerTwoScore, forKey: "playerTwoScore")
        do {
            try context.save()
        } catch {
            print(error)
        }
        
        
    }
    func getLastBoardState() -> Board{
        
        //check if theres board states if so clear them
        clearBoardStates()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "BoardModel")
        do {
            let results = try context.fetch(request)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    let val_currentTurnOwnPlayerId: Int,
                        val_a1: Int,
                        val_a2: Int,
                        val_a3: Int,
                        val_b1: Int,
                        val_b2: Int,
                        val_b3: Int,
                        val_c1: Int,
                        val_c2: Int,
                        val_c3: Int
                val_currentTurnOwnPlayerId = result.value(forKey: "currentTurnOwnPlayerId") as! Int
                    val_a1 = result.value(forKey: "a1") as! Int
                    val_a2 = result.value(forKey: "a2") as! Int
                    val_a3 = result.value(forKey: "a3") as! Int
                    val_b1 = result.value(forKey: "b1") as! Int
                    val_b2 = result.value(forKey: "b2") as! Int
                    val_b3 = result.value(forKey: "b3") as! Int
                    val_c1 = result.value(forKey: "c1") as! Int
                    val_c2 = result.value(forKey: "c2") as! Int
                    val_c3 = result.value(forKey: "c3") as! Int
                    
                         
                    let boardstate : Board = Board(
                        a1: val_a1,
                        a2: val_a2,
                        a3: val_a3,
                        b1: val_b1,
                        b2: val_b2,
                        b3: val_b3,
                        c1: val_c1,
                        c2: val_c2,
                        c3: val_c3,
                        currentTurnOwnPlayerId: val_currentTurnOwnPlayerId
                    )
                    return boardstate
                    
                }
                
            }
        } catch {
            print(error)
        }
        return Board(a1: 0, a2: 0, a3: 0, b1: 0, b2: 0, b3: 0, c1: 0, c2: 0, c3: 0, currentTurnOwnPlayerId: 1)
        
    }
    func getPlayerState() -> Player{
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
                    return playerState
                    
                }
            }
        } catch {
            print(error)
        }
        return Player(playerOneScore: 0, playerTwoScore: 0)
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
}
