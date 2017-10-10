//
//  MenuPageChange.swift
//  Brew Project
//
//  Created by Lucas Hall on 10/8/17.
//  Copyright © 2017 Lucas Hall. All rights reserved.
//

import UIKit

class Navigator: UIViewController {
   override func viewDidLoad() {
      super.viewDidLoad()
   }

   
   // Update Current Window
   var window:UIWindow = UIWindow()
   
   
   func showControllerForMenuSelection(menuSelection: MenuSelection) {
      
      if let window = UIApplication.shared.keyWindow {
         
         // prime the pump
//         self.window = UIWindow(frame: UIScreen.main.bounds)
         let storyboard = UIStoryboard(name: "Main", bundle: nil)
         //let appDelegate = UIApplication.shared.delegate as! AppDelegate
         window.rootViewController?.dismiss(animated: false, completion: nil)
         
         
         
         // OPEN Brew Projects
         if menuSelection.name == "Brew Projects" {
            let brewProjectsVC = storyboard.instantiateViewController(withIdentifier:"brewProjectsNavigationController") as UIViewController
            brewProjectsVC.view.frame = UIScreen.main.bounds
            UIView.transition(with: window, duration: 0.5, options: .transitionFlipFromRight, animations: {
               window.rootViewController = brewProjectsVC
            }, completion: nil)
            
            //window.rootViewController?.present(brewProjectsVC, animated: true, completion: nil)
            
         // OPEN Recipes
         } else if menuSelection.name == "Recipes" {
            let recipesVC = storyboard.instantiateViewController(withIdentifier:"recipesNavigationController") as UIViewController
            recipesVC.view.frame = UIScreen.main.bounds
            UIView.transition(with: window, duration: 0.5, options: .transitionFlipFromRight, animations: {
               window.rootViewController = recipesVC
            }, completion: nil)
            
            //window.rootViewController?.present(recipesVC, animated: true, completion: nil)
            
         // OPEN Calculators
         } else if menuSelection.name == "Calculators" {
            let calculatorsVC = storyboard.instantiateViewController(withIdentifier:"calculatorsNavigationController") as UIViewController
            calculatorsVC.view.frame = UIScreen.main.bounds
            UIView.transition(with: window, duration: 0.5, options: .transitionFlipFromRight, animations: {
               window.rootViewController = calculatorsVC
            }, completion: nil)
            
            //window.rootViewController?.present(calculatorsVC, animated: true, completion: nil)
            
         // OPEN Help
         } else if menuSelection.name == "Help" {
            let helpVC = storyboard.instantiateViewController(withIdentifier:"helpNavigationController") as UIViewController
            helpVC.view.frame = UIScreen.main.bounds
            UIView.transition(with: window, duration: 0.5, options: .transitionFlipFromRight, animations: {
               window.rootViewController = helpVC
            }, completion: nil)
            
            //window.rootViewController?.present(helpVC, animated: true, completion: nil)
            
         // OPEN About
         } else if menuSelection.name == "About" {
            let aboutVC = storyboard.instantiateViewController(withIdentifier:"aboutNavigationController") as UIViewController
            aboutVC.view.frame = UIScreen.main.bounds
            UIView.transition(with: window, duration: 0.5, options: .transitionFlipFromRight, animations: {
               window.rootViewController = aboutVC
            }, completion: nil)
            
            //window.rootViewController?.present(aboutVC, animated: true, completion: nil)
         }
      
      }
         
      print("This section worked! YES!")
   }
}
