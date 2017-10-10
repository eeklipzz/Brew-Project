//
//  vcMain.swift
//  Brew Project
//
//  Created by Lucas Hall on 9/25/17.
//  Copyright © 2017 Lucas Hall. All rights reserved.
//

import UIKit

class vcMain: UIViewController {
   let resetOnboardViewed = false
   override func viewDidLoad() {
      super.viewDidLoad()
      
      // Do any additional setup after loading the view.
   }
   
   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }
   
   @IBOutlet weak var resetButton: UIButton!
   @IBAction func didTapReset(_ sender: UIButton) {
      UserDefaults.standard.set(resetOnboardViewed, forKey: "onboardViewed")
      
      // Report to console
       reportUserDefaultValueAtLocation(inUserDefaultKey: "onboardViewed", inUserDefaultKeyType: "Bool", inLocationTerm: "Reset Button")
   }
   
   @IBOutlet weak var testingButton: UIButton!
   @IBAction func didTapTesting(_ sender: UIButton) {
      // Report to console
      reportUserDefaultValueAtLocation(inUserDefaultKey: "onboardViewed", inUserDefaultKeyType: "Bool", inLocationTerm: "Testing Button")
   }
   
   
}
