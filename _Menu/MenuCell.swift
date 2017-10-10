//
//  MenuCell.swift
//  Brew Project
//
//  Created by Lucas Hall on 9/30/17.
//  Copyright © 2017 Lucas Hall. All rights reserved.
//

import UIKit

class MenuCell: BaseCell {
   
   override var isHighlighted: Bool {
      didSet {
         if menuSelection?.isEnabled == true {
            backgroundColor = isHighlighted ? menuBackgroundHighlightUIColor : menuBackgroundUIColor
            nameLabel.textColor = isHighlighted ? menuHighlightedTextUIColor : menuEnabledTextUIColor
            menuImageView.tintColor = isHighlighted ? menuImageHighlightTintUIColor : menuImageTintUIColor
         }
      }
   }
   
   // Create individual Menu Selection
   var menuSelection: MenuSelection? {
      didSet {
         if menuSelection?.name != nil {
            // set name
            nameLabel.text = menuSelection?.name
            
            // set disabled color when needed
            if menuSelection?.isEnabled == false {
               nameLabel.textColor = menuDisabledTextUIColor
            } else {
               nameLabel.textColor = menuEnabledTextUIColor
            }
            
            // set arrow arrow/noArrow
            if menuSelection?.isCurrent == true {
               menuImageView.image = UIImage(named: "menuArrow")?.withRenderingMode(.alwaysTemplate)
               self.isSelected = true
            } else {
               menuImageView.image = UIImage(named: "blankArrow")?.withRenderingMode(.alwaysTemplate)
            }
            menuImageView.tintColor = menuImageTintUIColor
         }
      }
   }
   
   let nameLabel: UILabel = {
      let label = UILabel()
      label.text = "MenuSelection"
      label.font = menuLabelFontSize
      label.textColor = menuEnabledTextUIColor
      return label
   }()
   
   let menuImageView: UIImageView = {
      var imageView = UIImageView()
      imageView.image = UIImage(named: "menuArrow")
      imageView.contentMode = .center
      imageView.translatesAutoresizingMaskIntoConstraints = false
      return imageView
   }()
   
   override func setupViews() {
      super.setupViews()

      // Center text
      addSubview(nameLabel)
      addSubview(menuImageView)
      
      addContraintsWithFormat(format: "H:|-16-[v0(30)]-8-[v1]|", views: menuImageView, nameLabel)
      addContraintsWithFormat(format: "V:|[v0]|", views: nameLabel)
      addContraintsWithFormat(format: "V:|[v0]|", views: menuImageView)
      
      addConstraint(NSLayoutConstraint(item: menuImageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1,constant: 0))
   }
}
