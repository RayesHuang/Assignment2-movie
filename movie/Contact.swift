//
//  Contact.swift
//  movie
//
//  Created by Apple on 22/05/2015.
//  Copyright (c) 2015 Apple. All rights reserved.
//

import Foundation
import CoreData

@objc(Contact)
class Contact: NSManagedObject {

    @NSManaged var firstName: String
    @NSManaged var lastName: String
    @NSManaged var email: String
    @NSManaged var phone: String
    @NSManaged var identifier: String
    @NSManaged var bookMovie: NSSet

}
