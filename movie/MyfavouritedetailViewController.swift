//
//  MyfavouritedetailViewController.swift
//  movie
//
//  Created by Shuaiji Qian on 15/5/26.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

import UIKit

class MyfavouritedetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var overviewLabel: UILabel!
    var myfavourite:Myfavourite!
    override func viewDidLoad() {
        super.viewDidLoad()
      titleLabel.text=myfavourite.title
      overviewLabel.text=myfavourite.overview
        var posterimage:UIImage = UIImage(data: myfavourite.poster)!
        posterImage.image=posterimage
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
