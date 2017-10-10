//
//  Global Variables.swift
//  Brew Project
//
//  Created by Lucas Hall on 10/3/17.
//  Copyright © 2017 Lucas Hall. All rights reserved.
//

import UIKit



// Menu
let menuLabelFontSize = UIFont.systemFont(ofSize: 18)
let menuCellHeight:CGFloat = 50
let menuBackgroundUIColor:UIColor = UIColor(hex: "EFEFEF")
let menuBackgroundHighlightUIColor:UIColor = UIColor(hex: "0072FF") // primary blue color
let menuBorderWidth:CGFloat = 1
let menuBorderColor:CGColor = HexToCGColor(from: "cccccc")
let menuEnabledTextUIColor:UIColor = UIColor(hex: "0072FF")
let menuHighlightedTextUIColor:UIColor = UIColor(hex: "ffffff")
let menuDisabledTextUIColor:UIColor = UIColor(hex: "cccccc")
let menuImageTintUIColor:UIColor = UIColor(hex: "0072FF")
let menuImageHighlightTintUIColor:UIColor = UIColor(hex: "ffffff")

// Menu > Dismisser
let dismisserBackgroundUIColor:UIColor = UIColor(hex: "ffffff")
let dismisserOffset:CGFloat = 70 // dismisser width
let dismisserShadowUIColor:CGColor = HexToCGColor(from: "ffffff")
let dismisserShadowOffset:CGSize = CGSize(width: -5.5, height: 0)
let dismisserShadowRadius:CGFloat = 3.0
let dismisserShadowOpacity:Float = 0.26
let dismisserImageTintUIColor:UIColor = UIColor(hex: "0072FF")
let dismisserImageHeight:CGFloat = 50
let dismisserCellHeight:CGFloat = dismisserImageHeight
let dismisserImagePositionSpacer = (dismisserOffset/2)-(dismisserImageHeight/2)
