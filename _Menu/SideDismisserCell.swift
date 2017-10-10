//
//  SideDismisserCell.swift
//  Brew Project
//
//  Created by Lucas Hall on 10/1/17.
//  Copyright © 2017 Lucas Hall. All rights reserved.
//

import UIKit

class SideDismisserCell: BaseCell {
   
   let dismisserView: UIImageView = {
      let thisDismisserView = UIImageView()
      thisDismisserView.image = UIImage(named: "dismisserX")?.withRenderingMode(.alwaysTemplate)
      thisDismisserView.contentMode = .scaleAspectFill
      thisDismisserView.tintColor = dismisserImageTintUIColor
      return thisDismisserView
   }()
   
   override func setupViews() {
      super.setupViews()
      addSubview(dismisserView)

      let topSpace:CGFloat = menuCellHeight
      addContraintsWithFormat(format: "H:|-\(dismisserImagePositionSpacer)-[v0(\(dismisserImageHeight))]|", views: dismisserView)
      addContraintsWithFormat(format: "V:|-\(topSpace)-[v0(\(dismisserImageHeight))]|", views: dismisserView)
   }
}
