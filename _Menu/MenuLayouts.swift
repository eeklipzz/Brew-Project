//
//  MenuLayouts.swift
//  Brew Project
//
//  Created by Lucas Hall on 10/6/17.
//  Copyright © 2017 Lucas Hall. All rights reserved.
//

import UIKit

// Initializers
var hasOpenedMenu:Bool = false
var currentMenuIndex:Int = 0

let brewProjects:String = "Brew Projects"
let recipes:String = "Recipes"
let calculators:String = "Calculators"
let help:String = "Help"
let about:String = "About"


// Menu > Layouts
let MenuLayout_BrewProjects: [MenuSelection] = {
   return [MenuSelection(name:"", isCurrent:false, isEnabled:false),
      MenuSelection(name:brewProjects, isCurrent:true, isEnabled:true),  // <-- This one current
      MenuSelection(name:recipes, isCurrent:false, isEnabled:false),
      MenuSelection(name:calculators, isCurrent:false, isEnabled:false),
      MenuSelection(name:"", isCurrent:false, isEnabled:false),
      MenuSelection(name:help, isCurrent:false, isEnabled:true),
      MenuSelection(name:about, isCurrent:false, isEnabled:true)]
}()

let MenuLayout_Recipe: [MenuSelection] = {
   return [MenuSelection(name:"", isCurrent:false, isEnabled:false),
      MenuSelection(name:brewProjects, isCurrent:false, isEnabled:true),
      MenuSelection(name:recipes, isCurrent:true, isEnabled:false),  // <-- This one current
      MenuSelection(name:calculators, isCurrent:false, isEnabled:false),
      MenuSelection(name:"", isCurrent:false, isEnabled:false),
      MenuSelection(name:help, isCurrent:false, isEnabled:true),
      MenuSelection(name:about, isCurrent:false, isEnabled:true)]
}()

let MenuLayout_Help: [MenuSelection] = {
   return [MenuSelection(name:"", isCurrent:false, isEnabled:false),
      MenuSelection(name:brewProjects, isCurrent:false, isEnabled:true),
      MenuSelection(name:recipes, isCurrent:false, isEnabled:false),
      MenuSelection(name:calculators, isCurrent:false, isEnabled:false),
      MenuSelection(name:"", isCurrent:false, isEnabled:false),
      MenuSelection(name:help, isCurrent:true, isEnabled:true),  // <-- This one current
      MenuSelection(name:about, isCurrent:false, isEnabled:true)]
}()

let MenuLayout_About: [MenuSelection] = {
   return [MenuSelection(name:"", isCurrent:false, isEnabled:false),
      MenuSelection(name:brewProjects, isCurrent:false, isEnabled:true),
      MenuSelection(name:recipes, isCurrent:false, isEnabled:false),
      MenuSelection(name:calculators, isCurrent:false, isEnabled:false),
      MenuSelection(name:"", isCurrent:false, isEnabled:false),
      MenuSelection(name:help, isCurrent:false, isEnabled:true),
      MenuSelection(name:about, isCurrent:true, isEnabled:true)]  // <-- This one current
}()


// Menu > Layouts
class MenuLayoutCatalogItem: NSObject {
   let name: String
   let layout: [MenuSelection]
   
   init(name: String, layout:[MenuSelection]){
      self.name = name
      self.layout = layout
   }
}

let MenuLayouts: [MenuLayoutCatalogItem] = {
   return [MenuLayoutCatalogItem(name:"Brew Projects", layout: MenuLayout_BrewProjects),
           MenuLayoutCatalogItem(name:"Recipe", layout: MenuLayout_Recipe),
           MenuLayoutCatalogItem(name:"Help", layout: MenuLayout_Help),
           MenuLayoutCatalogItem(name:"About", layout: MenuLayout_About)]
}()

func getMenuLayout(inName:String) -> [MenuSelection] {
   var outMenuLayout:[MenuSelection] = []
   if let index = MenuLayouts.index(where: { $0.name == inName }) {
      outMenuLayout = MenuLayouts[index].layout
   }
   return outMenuLayout
}

func setMenuLayoutIndex(inName:String) {
   if let index = MenuLayouts.index(where: { $0.name == inName }) {
      currentMenuIndex = index
   }
   return
}
