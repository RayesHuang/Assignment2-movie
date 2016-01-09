//
//  Myfavouritemodel.swift
//  movie
//
//  Created by Shuaiji Qian on 15/5/18.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

import Foundation
import CoreData
import UIKit
class Myfavouritemodel
{
    
    // Uses Core Data to manage data persistence
    var myfavourites  : [Myfavourite] = [Myfavourite]()
    
    
    func getMyfavourite(indexPath: NSIndexPath) -> Myfavourite
    {
        return myfavourites[indexPath.row]
    }
    
    
    
    func deleteMyfavourites(indexPath: NSIndexPath)
    {
        let myfavourite = myfavourites[indexPath.row]
        
        // Get a reference to your App Delegate
        let appDelegate =
        UIApplication.sharedApplication().delegate as AppDelegate
        
        // Get a reference to a ManagedObjectContext for interacting with
        // the underlying database
        let managedContext = appDelegate.managedObjectContext!
        managedContext.deleteObject(myfavourite)
        
        myfavourites.removeAtIndex(indexPath.row)
        
        var error: NSError?
        if !managedContext.save(&error)
        {
            abort()
        }
    }
    
    
    func getMyfavourites()
    {
        // Get a reference to your App Delegate
        let appDelegate =
        UIApplication.sharedApplication().delegate as AppDelegate
        
        // Get a reference to a ManagedObjectContext for interacting with
        // the underlying database
        let managedContext = appDelegate.managedObjectContext!
        
        
        // Retrieve all the records in the table
        let fetchRequest = NSFetchRequest(entityName:"Myfavourite")
        var error: NSError?
        let fetchedResults =
        managedContext.executeFetchRequest(fetchRequest,
            error: &error) as [Myfavourite]?
        
        // Assign the results to the Myfavouritemodel
        if let results = fetchedResults
        {
            myfavourites = results
        }
        else
        {
            println("Could not fetch \(error), \(error!.userInfo)")
        }
    }
    
    func checkexisting(thetitle:String)->Bool
    {
        var existing=false
        let appDelegate =
        UIApplication.sharedApplication().delegate as AppDelegate
        
        // Get a reference to a ManagedObjectContext for interacting with
        // the underlying database
        let managedContext = appDelegate.managedObjectContext!
        
        
        // Retrieve all the records in the table
        let fetchRequest = NSFetchRequest(entityName:"Myfavourite")
        var error: NSError?
        let fetchedResults =
        managedContext.executeFetchRequest(fetchRequest,
            error: &error) as [Myfavourite]?
        
        // Assign the results to the Myfavouritemodel
        if let results = fetchedResults
        {
            myfavourites = results
        }
        else
        {
            println("Could not fetch \(error), \(error!.userInfo)")
        }
        
        for favourite in myfavourites
        {
            if favourite.title==thetitle
            {existing=true}
        }
        
    return existing
    
    }
    
    
    func saveMyfavourite(title: String, overview:String, poster:NSData, existing: Myfavourite?)
    {
        // Get a reference to your App Delegate
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        
        // Get a reference to a ManagedObjectContext for interacting with
        // the underlying database
        let managedContext = appDelegate.managedObjectContext!
        
        // Get a entity from the database that represents the table your are
        // wishing to work with
        let entity =  NSEntityDescription.entityForName("Myfavourite",inManagedObjectContext:managedContext)
        
        if((existing) == nil)
        {
            // Create an object based on the Entity
            let myfavourite = Myfavourite(entity: entity!,insertIntoManagedObjectContext:managedContext)
            myfavourite.title = title
            myfavourite.overview = overview
            myfavourite.poster = poster
            self.myfavourites.append(myfavourite)
        }
        else
        {
            existing!.title = title
            existing!.overview = overview
            existing!.poster=poster
        }
        
        // Check for errors and save
        var error: NSError?
        if !managedContext.save(&error) {
            println("Could not save \(error), \(error?.userInfo)")
        }
    }
    
    /* This is a class variable allowing me to access it
    without first instantiating the model
    
    Now we can retrieve the model without instantiating it directly
    
    var model = Myfavouritemodel.sharedInstance
    */
    
    // Here we use a Struct to hold the instance of the model i.e itself
    private struct Static
    {
        static var instance: Myfavouritemodel?
    }
    
    private init(){}
    
    class var sharedInstance: Myfavouritemodel
    {
        if (Static.instance == nil)
        {
            Static.instance = Myfavouritemodel()
        }
        return Static.instance!
    }
    
}