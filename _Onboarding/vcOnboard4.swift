//
//  vcOnboard4.swift
//  Brew Project
//
//  Created by Lucas Hall on 9/28/17.
//  Copyright © 2017 Lucas Hall. All rights reserved.
//

import UIKit

class vcOnboard4: UIViewController {
   let onboardViewed = true
   override func viewDidLoad() {
      super.viewDidLoad()
      
      // Do any additional setup after loading the view.
   }
   
   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }
   
   @IBOutlet weak var openApp: UIButton!
   @IBAction func didTapOpenApp(_ sender: UIButton) {
      UserDefaults.standard.set(onboardViewed, forKey: "onboardViewed")
      performSegue(withIdentifier: "segueToBrewProjects", sender: self)
   }
   
   
}
