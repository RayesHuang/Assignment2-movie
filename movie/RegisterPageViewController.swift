//
//  RegisterPageViewController.swift
//  movie
//
//  Created by Apple on 17/05/2015.
//  Copyright (c) 2015 Apple. All rights reserved.
//

import UIKit

class RegisterPageViewController: UIViewController {

    
    @IBOutlet weak var userEmailTextField: UITextField!
    
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    @IBOutlet weak var userPasswordConfirmTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func registerButtonTapped(sender: AnyObject) {
        
        let userEmail = userEmailTextField.text
        let userPassword = userPasswordTextField.text
        let userPasswordConfirm = userPasswordConfirmTextField.text
        
        //check for empty fields
        if (userEmail.isEmpty || userPassword.isEmpty || userPasswordConfirm.isEmpty)
        {
            //display alert message
            displayMyAlertMessage("All fields are required")
            return
        }
        if (userPassword != userPasswordConfirm)
        {
            //display alert message
            displayMyAlertMessage("Password not match")
           
            return
        }
        
        //store data 
        NSUserDefaults.standardUserDefaults().setObject(userEmail, forKey: "userEmail")
        NSUserDefaults.standardUserDefaults().setObject(userPassword, forKey: "userPassword")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        //dispaly alert message with confirmation
        var myAlert = UIAlertController(title: "Alert", message: "Registerion is sucessful. Thank you!", preferredStyle: UIAlertControllerStyle.Alert)
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default){
            action in self.dismissViewControllerAnimated(true, completion: nil)
        }
        
        myAlert.addAction(okAction)
        self.presentViewController(myAlert, animated:true, completion:nil)
    }
    
    
    func displayMyAlertMessage(userMessage: String){
        var myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        myAlert.addAction(okAction)
        
        self.presentViewController(myAlert, animated: true, completion: nil)
        
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
