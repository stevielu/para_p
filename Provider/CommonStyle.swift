//
//  CommonStyle.swift
//  Provider
//
//  Created by imac on 2/08/16.
//  Copyright © 2016 newnergy. All rights reserved.
//

import Foundation
import UIKit

class globalStyle {
    //width & height
    static var screenSize: CGRect = UIScreen.mainScreen().bounds
    static let start = screenSize.width/3

    //font
    static let subTitleColor = UIColor(netHex:0x666666)
    static let subTitleFontsize = UIFont(name:"Helvetica",size: 10.0)
    
    //color
    static let backgroundColor = UIColor(netHex:0xE07371)
    
    //thickness
    static let thickness:CGFloat = 0.5
}