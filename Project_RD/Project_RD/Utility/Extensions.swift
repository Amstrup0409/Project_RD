//
//  Utility.swift
//  Project_RD
//
//  Created by Christian Amstrup Petersen on 16/06/2020.
//  Copyright © 2020 Christian Amstrup Petersen. All rights reserved.
//

import UIKit

extension Comparable {

    func clamped(to range: ClosedRange<Self>) -> Self {

        if self > range.upperBound {
            return range.upperBound
        } else if self < range.lowerBound {
            return range.lowerBound
        } else {
            return self
        }
    }
}

public extension UIColor {

  func lighter(by percentage: CGFloat = 30.0) -> UIColor {
    return self.adjustBrightness(by: abs(percentage))
  }

  func darker(by percentage: CGFloat = 30.0) -> UIColor {
    return self.adjustBrightness(by: -abs(percentage))
  }

  func adjustBrightness(by percentage: CGFloat = 30.0) -> UIColor {

    let ratio = percentage/100

    var red:   CGFloat = 0.0
    var green: CGFloat = 0.0
    var blue:  CGFloat = 0.0
    var alpha: CGFloat = 0.0

    if self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
      let newRed =   (red   + ((ratio < 0) ? red   * ratio : (1 - red)   * ratio)).clamped(to: 0.0 ... 1.0)
      let newGreen = (green + ((ratio < 0) ? green * ratio : (1 - green) * ratio)).clamped(to: 0.0 ... 1.0)
      let newBlue =  (blue  + ((ratio < 0) ? blue  * ratio : (1 - blue)  * ratio)).clamped(to: 0.0 ... 1.0)
      return UIColor(red: newRed, green: newGreen, blue: newBlue, alpha: alpha)
    }
    return self
  }
}

extension UIEdgeInsets {    
    init(all amount: CGFloat) {
        self.init(top: amount, left: amount, bottom: amount, right: amount)
    }
    
}
