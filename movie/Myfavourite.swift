//
//  Myfavourite.swift
//  movie
//
//  Created by Shuaiji Qian on 15/5/18.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

import Foundation
import CoreData

class Myfavourite: NSManagedObject ,iMyfavourite{

    @NSManaged var title: String
    @NSManaged var overview: String
    @NSManaged var poster: NSData
    
    
    
    func getTitle()->String
    {
        return self.title as String
    }
    
    func getOverview()->String
    {
        return self.overview as String
    }
  
    func getPoster()->NSData
    {
        return self.poster as NSData
    }
    
   
    
    
    
}
