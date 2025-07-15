//
//  UIPageControl+Appearance.swift
//  Netgear
//
//  Created by Cillian O'Keeffe on 15/07/2025.
//

import UIKit

extension UIPageControl {
    
    class func applyStyle() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .tertiaryLabel
        UIPageControl.appearance().pageIndicatorTintColor = .tertiarySystemFill
    }
}
