//
//  pvcOnboard0.swift
//  Brew Project
//
//  Created by Lucas Hall on 9/26/17.
//  Copyright © 2017 Lucas Hall. All rights reserved.
//

import UIKit

class pvcOnboard0: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
   lazy var VCArr: [UIViewController] = {
      return [self.VCInstance(name: "vcOnboard1"),
              self.VCInstance(name: "vcOnboard2"),
              self.VCInstance(name: "vcOnboard3"),
              self.VCInstance(name: "vcOnboard4")]
   }()
   
   private func VCInstance(name: String) -> UIViewController {
      return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: name)
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      self.dataSource = self
      self.delegate = self
      if let firstVC = VCArr.first {
         setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
      }
      
   }
   
   override func viewDidLayoutSubviews() {
      super.viewDidLayoutSubviews()
      for view in self.view.subviews {
         if view is UIScrollView {
            view.frame = UIScreen.main.bounds
         } else if view is UIPageControl {
            //view.backgroundColor = UIColor(hex: "ff0000")
            view.backgroundColor = UIColor.clear
            //view.backgroundColor = UIColor.lightGray
         }
      }
   }
   
   
   // allows scrolling towards left (previous)
   public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
      guard let viewControllerIndex = VCArr.index(of: viewController) else {
         return nil
      }
      
      let previousIndex = viewControllerIndex - 1

      // Allows for infinite scrolling left
      guard previousIndex >= 0 else {
         //return VCArr.last
         return nil
      }
      guard VCArr.count > previousIndex else {
         return nil
      }
      return VCArr[previousIndex]
   }
   
   // allows scrolling towards right (next)
   public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
      guard let viewControllerIndex = VCArr.index(of: viewController) else {
         return nil
      }
      
      let nextIndex = viewControllerIndex + 1
      
      // Allows for infinite scrolling right
      //guard nextIndex < VCArr.count else {
      //   return VCArr.first
      //}
      guard VCArr.count > nextIndex else {
         return nil
      }
      return VCArr[nextIndex]
   }
   
   public func presentationCount(for pageViewController: UIPageViewController) -> Int {
      return VCArr.count
   }
   
   public func presentationIndex(for pageViewController: UIPageViewController) -> Int {
      guard let firstViewController = viewControllers?.first, let firstViewControllerIndex = VCArr.index(of: firstViewController) else {
         return 0
      }
      return firstViewControllerIndex
   }

   // All the ability to slide to the next screen from a next button.
   public func nextPage() {
      let nextIndex = self.presentationIndex(for: self) + 1
      setViewControllers([VCArr[nextIndex]], direction: .forward, animated: true, completion: nil)
      //}
   }
}
