//
//  BrewProjects.swift
//  Brew Project
//
//  Created by Lucas Hall on 9/29/17.
//  Copyright © 2017 Lucas Hall. All rights reserved.
//

import UIKit

class BrewProjects: UIViewController {
   let resetOnboardViewed = false
   override func viewDidLoad() {
      super.viewDidLoad()
      
      // Do any additional setup after loading the view.
   }
   
   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }
   
  
   // MENU
   lazy var thisMenuLauncher: MenuLauncher = {
      let launcher = MenuLauncher()
      launcher.brewProjectsController = self
      return launcher
   }()
   
   func handleMenu() {
      thisMenuLauncher.showCurrentMenuLayout()
   }
   @IBOutlet weak var menuButton: UIBarButtonItem!
   @IBAction func didTapMenu(_ sender: Any) {
      handleMenu()
   }
   
   // RESET User Defaults
   @IBOutlet weak var resetButton: UIButton!
   @IBAction func didTapReset(_ sender: UIButton) {
      UserDefaults.standard.set(resetOnboardViewed, forKey: "onboardViewed")
   }
   
}
