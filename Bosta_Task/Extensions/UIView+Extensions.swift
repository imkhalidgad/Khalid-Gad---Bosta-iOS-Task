//
//  UIView+Extensions.swift
//  Bosta_Task
//
//  Created by Khalid Gad on 27/02/2025.
//

import Foundation
import UIKit

extension UIView {
    
    var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
        }
    }
    
}
