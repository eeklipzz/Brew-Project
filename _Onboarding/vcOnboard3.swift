//
//  vcOnboard3.swift
//  Brew Project
//
//  Created by Lucas Hall on 9/25/17.
//  Copyright © 2017 Lucas Hall. All rights reserved.
//

import UIKit

class vcOnboard3: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   // BUTTON:
   @IBOutlet weak var nextButton: UIButton!
   @IBAction func didTapNext(_ sender: UIButton) {
      let pageViewController = self.parent as! pvcOnboard0
      pageViewController.nextPage()
   }

}
