//
//  About.swift
//  Brew Project
//
//  Created by Lucas Hall on 10/8/17.
//  Copyright © 2017 Lucas Hall. All rights reserved.
//

import UIKit

class About: UIViewController {

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
      launcher.aboutController = self
      return launcher
   }()
   
   func handleMenu() {
      thisMenuLauncher.showCurrentMenuLayout()
   }
   
   @IBOutlet weak var menuButton: UIBarButtonItem!
   @IBAction func didTapMenuButton(_ sender: Any) {
      handleMenu()
   }
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
