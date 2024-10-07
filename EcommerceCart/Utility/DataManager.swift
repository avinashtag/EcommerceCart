//
//  DataManager.swift
//  EcommerceCart
//
//  Created by Avinash on 04/10/2024.
//

import Foundation
import CoreData

class DataManager{
    
    static var shared: DataManager = DataManager()
    
    var persistentContainer: NSPersistentContainer
    var viewContext: NSManagedObjectContext
    var writeContext: NSManagedObjectContext
    
    
    init() {
        persistentContainer = NSPersistentContainer(name: "EcommerceCartDataModel")
        persistentContainer.loadPersistentStores(completionHandler: { (storeDescription, error) in
            guard let error = error else { return }
            fatalError("Unresolved error \(error)")
        })
        self.viewContext = persistentContainer.viewContext
        self.writeContext = persistentContainer.newBackgroundContext()
    }

    // Save Core Data context
    
    func save( context: NSManagedObjectContext) throws{
        
        guard context.hasChanges else { return }
        try context.save()
    }
    
    func merge( context: NSManagedObjectContext){
        context.mergeChanges(fromContextDidSave: Notification(name: Notification.Name(rawValue: "MergeChanges")))
    }
    
    //FetchQuery - done 
    //Predicate - done
    //Sorting - done
    //Relationships done
    //Transient - will not save in persistent store , short term
    

}



//    var persistenceCon : NSPersistentContainer!
//
//    var persistenceC: NSPersistentContainer = {
//        let container = NSPersistentContainer(name: "EcommerceCartDataModel")
//        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
//            if let error = error as NSError? {
//                fatalError("Unresolved error \(error), \(error.userInfo)")
//            }
//        })
//        return container
//    }()
//
