//
//  help.swift
//  Provider
//
//  Created by imac on 2/08/16.
//  Copyright © 2016 newnergy. All rights reserved.
//

import Foundation
import UIKit

class help{
    
    static func reSizeImage(scaledToSize newSize:CGSize) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0);
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    static func differenceDate(lateDate date1:String,earlierDate date2:String) -> NSDateComponents{
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateLate = dateFormatter.dateFromString(date1)!
        let dateEarly = dateFormatter.dateFromString(date2)!
        
        let diffDateComponents = NSCalendar.currentCalendar().components([NSCalendarUnit.Year, NSCalendarUnit.Month, NSCalendarUnit.Day, NSCalendarUnit.Hour, NSCalendarUnit.Minute, NSCalendarUnit.Second], fromDate: dateEarly, toDate: dateLate, options: NSCalendarOptions.init(rawValue: 0))
        
        return diffDateComponents
        
    }
}


