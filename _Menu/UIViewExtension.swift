//
//  UIView.swift
//  Brew Project
//
//  Created by Lucas Hall on 9/30/17.
//  Copyright © 2017 Lucas Hall. All rights reserved.
//

import UIKit

extension UIView {
   func addContraintsWithFormat(format: String, views: UIView...) {
      var viewsDictionary = [String: UIView]()
      for (index, view) in views.enumerated() {
         let key = "v\(index)"
         view.translatesAutoresizingMaskIntoConstraints = false
         viewsDictionary[key] = view
      }
      addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
   }
}
