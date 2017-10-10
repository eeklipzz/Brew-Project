//
//  BaseCell.swift
//  Brew Project
//
//  Created by Lucas Hall on 9/30/17.
//  Copyright © 2017 Lucas Hall. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
   override init(frame: CGRect) {
      super.init(frame: frame)
      setupViews()
   }
   func setupViews() {
   }
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
