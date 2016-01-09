//
//  ContactPersonDetailViewController.swift
//  movie
//
//  Created by Apple on 22/05/2015.
//  Copyright (c) 2015 Apple. All rights reserved.
//

import UIKit
import CoreData

class ContactPersonDetailViewController: UIViewController {

    
    @IBOutlet weak var FirstNameTextField: UITextField!
    
    @IBOutlet weak var LastNameTextField: UITextField!
    
    @IBOutlet weak var PhoneTextField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func ContactDetailDoneTapped(sender: AnyObject) {
        
        let moc:NSManagedObjectContext = SwiftCoreDataHelper.managedObjectContext()
        var contact:Contact = SwiftCoreDataHelper.insertManagedObject(NSStringFromClass(Contact), managedObjectConect: moc) as Contact
        contact.identifier = "\(NSDate())"
        contact.firstName = FirstNameTextField.text
        contact.lastName = LastNameTextField.text
        contact.email = EmailTextField.text
        contact.phone = PhoneTextField.text
        
        SwiftCoreDataHelper.saveManagedObjectContext(moc)
        self.navigationController?.popViewControllerAnimated(true)
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
