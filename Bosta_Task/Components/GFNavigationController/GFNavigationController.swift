//
//  GFNavigationController.swift
//  Bosta_Task
//
//  Created by Khalid Gad on 27/02/2025.
//

import Foundation
import UIKit

class GFNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationController()
    }
    
    func setUpNavigationController() {
        self.viewControllers = [ProfileViewController()]
    }
}
