//
//  Conversions.swift
//  Brew Project
//
//  Created by Lucas Hall on 9/25/17.
//  Copyright © 2017 Lucas Hall. All rights reserved.
//
import UIKit


// Usage...
// something = HexToCGColor(from hex: "000000")
func HexToCGColor(from hexString : String) -> CGColor {
   if let rgbValue = UInt(hexString, radix: 16) {
      let red   =  CGFloat((rgbValue >> 16) & 0xff) / 255
      let green =  CGFloat((rgbValue >>  8) & 0xff) / 255
      let blue  =  CGFloat((rgbValue      ) & 0xff) / 255
      return UIColor(red: red, green: green, blue: blue, alpha: 1.0).cgColor
   } else {
      return UIColor.black.cgColor
   }
}

// Usage...
// something = UIColor(hex: "ff0000")
extension UIColor {
   convenience init(hex: String) {
      let scanner = Scanner(string: hex)
      scanner.scanLocation = 0
      
      var rgbValue: UInt64 = 0
      
      scanner.scanHexInt64(&rgbValue)
      
      let r = (rgbValue & 0xff0000) >> 16
      let g = (rgbValue & 0xff00) >> 8
      let b = rgbValue & 0xff
      
      self.init(
         red: CGFloat(r) / 0xff,
         green: CGFloat(g) / 0xff,
         blue: CGFloat(b) / 0xff, alpha: 1
      )
   }
}
