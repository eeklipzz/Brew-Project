//
//  Console Tools.swift
//  Brew Project
//
//  Created by Lucas Hall on 9/29/17.
//  Copyright © 2017 Lucas Hall. All rights reserved.
//

import Foundation

// Report value at a location
func reportUserDefaultValueAtLocation(
   inUserDefaultKey:String,
   inUserDefaultKeyType:String,
   inLocationTerm:String) {
   
   var outDefaultValue:String = ""
   if UserDefaults.standard.value(forKey: inUserDefaultKey) != nil {
      switch inUserDefaultKeyType {
      case "Bool":
         outDefaultValue = String(UserDefaults.standard.value(forKey: inUserDefaultKey) as! Bool)
      case "String":
         outDefaultValue = String(UserDefaults.standard.value(forKey: inUserDefaultKey) as! String)
      case "Int":
         outDefaultValue = String(UserDefaults.standard.value(forKey: inUserDefaultKey) as! Int)
      default:
         return
      }
      print("Location: \(inLocationTerm). \(inUserDefaultKey) value is \(outDefaultValue)")
   }
}
