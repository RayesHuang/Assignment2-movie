//
//  BookMovie.swift
//  movie
//
//  Created by Apple on 22/05/2015.
//  Copyright (c) 2015 Apple. All rights reserved.
//

import Foundation
import CoreData


@objc(BookMovie)
class BookMovie: NSManagedObject {

    @NSManaged var identifier: String
    @NSManaged var bookDate: NSDate
    @NSManaged var quantity: NSNumber
    @NSManaged var contact: NSManagedObject

}
