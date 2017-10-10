//
//  StretchTableViewCell.swift
//  Brew Project
//
//  Created by Lucas Hall on 9/29/17.
//  Copyright © 2017 Lucas Hall. All rights reserved.
//

import UIKit

class StretchTableViewCell: UITableViewCell {
   
   @IBOutlet weak var usernameLabel: UILabel!
   
   override func awakeFromNib() {
      super.awakeFromNib()
      
   }
   
   override func setSelected(_ selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)
      
      // Configure the view for the selected state
   }
   
}
