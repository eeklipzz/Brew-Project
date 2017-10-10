//
//  MenuLauncher.swift
//  Brew Project
//
//  Created by Lucas Hall on 9/29/17.
//  Copyright © 2017 Lucas Hall. All rights reserved.
//

import UIKit

class MenuSelection: NSObject {
   let name: String
   let isCurrent: Bool
   let isEnabled: Bool
   
   init(name:String, isCurrent:Bool, isEnabled:Bool){
      self.name = name
      self.isCurrent = isCurrent
      self.isEnabled = isEnabled
   }
}

class MenuLauncher:
   NSObject,
   UICollectionViewDataSource,
   UICollectionViewDelegate,
   UICollectionViewDelegateFlowLayout
{
   
   // MENU
  
   // Set up collection views
   let menuCV: UICollectionView = {
      let layout = UICollectionViewFlowLayout()
      let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
      cv.layer.borderWidth = menuBorderWidth
      cv.layer.borderColor = menuBorderColor
      cv.backgroundColor = menuBackgroundUIColor
      return cv
   }()
   let sideDismisserCV: UICollectionView = {
      let layout = UICollectionViewFlowLayout()
      let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
      cv.backgroundColor = dismisserBackgroundUIColor
      cv.layer.borderWidth = menuBorderWidth
      cv.layer.borderColor = menuBorderColor
      cv.layer.shadowColor = dismisserShadowUIColor
      cv.layer.shadowOffset = dismisserShadowOffset
      cv.layer.shadowOpacity = dismisserShadowOpacity
      cv.layer.shadowRadius = dismisserShadowRadius
      cv.clipsToBounds = false
      cv.layer.masksToBounds = false
      return cv
   }()
   
   // Conform to UICollectionView in Class
   let cellID = "cellID"
   
   // Default Menu Setup
   var currentMenuLayout:[MenuSelection] = MenuLayouts[currentMenuIndex].layout
   
   var brewProjectsController: BrewProjects?
   var recipesController: Recipes?
   var calculatorsController: Calculators?
   var helpController: Help?
   var aboutController: About?
   
   // OPEN MENU
   func showCurrentMenuLayout() {
      
      //show menu
      if let window = UIApplication.shared.keyWindow {
         
         // set up menu panel
         let menuWidth = window.frame.width // - dismisserOffset
         menuCV.frame = CGRect(x: -menuWidth, y: 0, width: menuWidth, height: window.frame.height)
         
         // set up sideDismisser panel
         let sideDismisserWidth = dismisserOffset
         let sideDismisserPosition = (window.frame.width - dismisserOffset)
         sideDismisserCV.frame = CGRect(x: (sideDismisserPosition + sideDismisserPosition), y: 0, width:sideDismisserWidth, height: window.frame.height)
         
         // dismiss overlay when tapped
         sideDismisserCV.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))

         // Animation NO Ease Out
         UIView.animate(withDuration: 0.3, animations: {
            self.sideDismisserCV.frame = CGRect(x: sideDismisserPosition, y: 0, width: menuWidth, height: window.frame.height)
         })

         // Animation Ease Out
         UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.menuCV.frame = CGRect(x: 0, y: 0, width: window.frame.width-dismisserOffset, height: window.frame.height)
         }, completion: nil)

         // Put it all on the screen
         window.addSubview(menuCV)
         window.addSubview(sideDismisserCV)
         
      }
   }
   
   // CLOSE MENU
   @objc func handleDismiss(menuSelection: MenuSelection) {
      let navigator = Navigator()
      navigator.showControllerForMenuSelection(menuSelection: menuSelection)
      
      UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
         
         if let window = UIApplication.shared.keyWindow {

            // reset the menu
            let menuWidth = window.frame.width - dismisserOffset + 5
            self.menuCV.frame = CGRect(x: -menuWidth, y: 0, width: menuWidth, height: window.frame.height)
            
            let sideDismisserWidth = dismisserOffset
            let sideDismisserPosition = window.frame.width - dismisserOffset
            self.sideDismisserCV.frame = CGRect(x: (sideDismisserPosition + sideDismisserPosition), y: 0, width:sideDismisserWidth, height: window.frame.height)
            
         }
      
         
      // After menu closes, pull up the correct.
      }) { (completed:Bool) in
         if menuSelection.isEnabled == true {
            // do nothing special
         }
      }
   }
   

   

   
   // BUILD Menu and Dismisser Collection Views
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      // set default cell sizes
      var newCGSize = CGSize()
      if collectionView == self.menuCV {
         // set to menu's default cell height
         newCGSize = CGSize(width: collectionView.frame.width, height: menuCellHeight)
      } else {
         // set to dismisser's default cell height
         newCGSize = CGSize(width: collectionView.frame.width, height: dismisserCellHeight)
      }
      return newCGSize
   }
  
   // DEFINE Cells in Collection View
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      // load menu
      var cell = UICollectionViewCell()
      if collectionView == self.menuCV {
         let newCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! MenuCell
         let thisMenuSelection = currentMenuLayout[indexPath.item]
         newCell.menuSelection = thisMenuSelection
         cell = newCell
      } else {
         cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
      }
      return cell
   }
   
   // SET number of cells in each of the Collection views
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      var numberOfCells:Int = 0
      if collectionView == self.sideDismisserCV {
         // Dismisser
         numberOfCells = 1
      } else if collectionView == self.menuCV {
         // Menu Options
         numberOfCells = currentMenuLayout.count
      }
      return numberOfCells
   }
   
   // ADJUST gap between cells
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
      return 0
   }
   
   // SET the correct menu layout
   func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      // Don't close if it's a disabled menu item
      let menuSelection = currentMenuLayout[indexPath.item]
      if menuSelection.isEnabled == false {
         return
      }
      
      //update uicollectionviewcontroller
      // Default Menu Setup
      setMenuLayoutIndex(inName: menuSelection.name)
      currentMenuLayout = MenuLayouts[currentMenuIndex].layout
      collectionView.reloadData()
      
      handleDismiss(menuSelection: menuSelection)
   }
   
   override init() {
      super.init()
      // menu
      menuCV.dataSource = self
      menuCV.delegate = self
      menuCV.register(MenuCell.self, forCellWithReuseIdentifier: cellID)
      
      // dismisser
      sideDismisserCV.dataSource = self
      sideDismisserCV.delegate = self
      sideDismisserCV.register(SideDismisserCell.self, forCellWithReuseIdentifier: cellID)
   }
}
