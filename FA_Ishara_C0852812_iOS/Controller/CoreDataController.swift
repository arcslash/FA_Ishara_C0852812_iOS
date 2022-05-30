//
//  CoreDataController.swift
//  FA_Ishara_C0852812_iOS
//
//  Created by Ishara Abeykoon on 2022-05-30.
//

import Foundation


class CoreDataController : UIViewController{
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appDelegate.persistentContainer.viewContext
    let newContact
    
    
    func initCoreData(){
        
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        newContact = NSEntityDescription.insertNewObject(forEntityName: "BoardModel", into: context)
        newContact = NSEntityDescription.insertNewObject(forEntityName: "Contact", into: context)
    }
    
    
    func addBoardState(){
        
    }
    func addPlayerState(){
        
    }
    func getBoardState(){
        
    }
    func getPlayerState(){
        
    }
}
