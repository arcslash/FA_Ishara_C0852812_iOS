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
    func addPlayerState(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let currentBoardState = NSEntityDescription.insertNewObject(forEntityName: "PlayerModel", into: context)
        
        
    }
    func getLastBoardState(){
        
    }
    func getPlayerState(){
        
    }
    
    func clearAllStates(){
        
    }
}
