//
//  MyfavouriteTableViewController.swift
//  movie
//
//  Created by Shuaiji Qian on 15/5/18.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

import UIKit

class MyfavouriteTableViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource{
    
    var myfavouritemodel = Myfavouritemodel.sharedInstance
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        myfavouritemodel.getMyfavourites()
        
    }
    
    override func  viewDidAppear(animated: Bool) {
        
        self.tableView.reloadData()
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return myfavouritemodel.myfavourites.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Myfavouritecell", forIndexPath: indexPath) as MyfavouriteTableViewCell
        
        let myfavourite = myfavouritemodel.getMyfavourite(indexPath)
        cell.titleLabel!.text = myfavourite.title
        cell.overviewLabel!.text = myfavourite.overview
        var posterimage:UIImage = UIImage(data: myfavourite.poster)!
        cell.posterImageView.image=posterimage
        
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        // Get a reference to your App Delegate
        let appDelegate =
        UIApplication.sharedApplication().delegate as AppDelegate
        
        // Get a reference to a ManagedObjectContext for interacting with
        // the underlying database
        let managedContext = appDelegate.managedObjectContext!
        
        if editingStyle == UITableViewCellEditingStyle.Delete
        {
            
            myfavouritemodel.deleteMyfavourites(indexPath)
            
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "myfavouriteDetail" {
            let myDetailViewController = segue.destinationViewController as MyfavouritedetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow()!
           
             let myfavouritemovie = myfavouritemodel.getMyfavourite(indexPath)
           myDetailViewController.myfavourite = myfavouritemovie
            
        }

    }
    
    
    
    
    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    
    
    
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the item to be re-orderable.
    return true
    }
    */
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    }
    */
    
    
}
