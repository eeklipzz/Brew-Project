//
//  vcOnboard2.swift
//  Brew Project
//
//  Created by Lucas Hall on 9/25/17.
//  Copyright © 2017 Lucas Hall. All rights reserved.
//

import UIKit

struct StretchyHeader {
   private let headerHeight: CGFloat = 200
   private let headerCut: CGFloat = 50
   
}

class vcOnboard2: UIViewController {
   
   var headerView: UIView!
   var newHeaderLayer: CAShapeLayer!
   
   override func viewDidLoad() {
      super.viewDidLoad()
   }
   
   func updateView() {
      //tableView.backgroundColor = UIColor.whiteColor()
      
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
