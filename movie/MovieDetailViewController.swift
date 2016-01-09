//
//  MovieDetailViewController.swift
//  movie
//
//  Created by Apple on 17/05/2015.
//  Copyright (c) 2015 Apple. All rights reserved.
//

import UIKit
import CoreData
class MovieDetailViewController: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var movieDetailImage: UIImageView!
    var movie: NSDictionary!
    var descri:String!
    var existingItem:Myfavourite!
    
    //the three var are used in the cast view
    var castname = [String]()
    var directorname=[String]()
    var writername=[String]()
    
    @IBOutlet weak var synopsisLabel: UILabel!
    
    @IBAction func saveaslike(sender: AnyObject) {
        
        
        let mymovieImageData:NSData=UIImagePNGRepresentation(movieDetailImage.image)
      
        var existing:Bool = Myfavouritemodel.sharedInstance.checkexisting(titleLabel.text!)
        if (existing==false)
        {
            Myfavouritemodel.sharedInstance.saveMyfavourite(titleLabel.text!,overview: synopsisLabel.text!, poster:mymovieImageData , existing: existingItem)
            displayMyAlertMessage("The moive has been add to favourite")
        }
        
        if existing
        {
        displayMyAlertMessage("The moive already in your favourite")
        }

    
    }
    
    func displayMyAlertMessage(userMessage: String){
        var myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        myAlert.addAction(okAction)
        
        self.presentViewController(myAlert, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor.blackColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.orangeColor()]
         var movieid=movie["id"] as Int
         var stringmovieid="\(movieid)" as String
        print(stringmovieid)
        titleLabel.text = movie["title"] as? String
        
        synopsisLabel.text = descri
        
        let baseImageUrlString = "https://image.tmdb.org/t/p/original"
        
        var url1 = movie.valueForKeyPath("poster_path") as? String
        var url=baseImageUrlString+url1!+"?api_key=d283197981cff3c20d5138aa61ea5085"
        

        movieDetailImage.setImageWithURL(NSURL(string: url)!)
        
        var basicurl="http://api.themoviedb.org/3/movie/"
        var apikey="?api_key=d283197981cff3c20d5138aa61ea5085"
        var credits="/credits"
        var crediturlstring=basicurl+stringmovieid+credits+apikey
        var urlcredit = NSURL(string: crediturlstring)!
        var requestcredit = NSURLRequest(URL: urlcredit)
        NSURLConnection.sendAsynchronousRequest(requestcredit, queue: NSOperationQueue.mainQueue()) {
            (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            var jsoncredit = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as NSDictionary
            var moviecast = jsoncredit["cast"] as [NSDictionary]
            var moviecrew = jsoncredit["crew"] as [NSDictionary]
            
            var n=0
            while (n<moviecast.count)
            {
            var themoviecast = moviecast[n]
            var moviecastname  = themoviecast["name"] as String
            self.castname.append(moviecastname)
            n=n+1
            }
            
            
            
            
           
            
            
            var a=0
            while (a<moviecrew.count)
            {
                var themoviecrew = moviecrew[a]
                var moviecrewjob  = themoviecrew["job"] as String
                if moviecrewjob=="Writer"
                {
                    self.writername.append(themoviecrew["name"] as String)
                }
                a=a+1
                
            }
            print(self.writername)
            
            
            var b=0
            while (b<moviecrew.count)
            {
                var themoviecrew = moviecrew[b]
                var moviecrewjob  = themoviecrew["job"] as String
                if moviecrewjob=="Director"
                {
                    self.directorname.append(themoviecrew["name"] as String)
                }
                b=b+1
                
            }
            print(self.directorname)
            
            
            
            
        
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
