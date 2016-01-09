//
//  iMyfavourite.swift
//  movie
//
//  Created by Shuaiji Qian on 15/5/18.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

import Foundation


protocol iMyfavourite {
    
    
    func getTitle() -> String
    func getOverview() -> String
    
    func getPoster()->NSData
}