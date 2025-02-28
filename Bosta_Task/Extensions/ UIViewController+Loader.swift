//
//   UIViewController+Loader.swift
//  Bosta_Task
//
//  Created by Khalid Gad on 27/02/2025.
//

import UIKit

extension UIViewController {
    
    private struct AssociatedKeys {
        static var loaderKey = "loaderKey"
    }
    
    private var loaderView: UIView? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.loaderKey) as? UIView
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.loaderKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func showLoader() {
        let loaderContainerView = UIView(frame: UIScreen.main.bounds)
        loaderContainerView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        loaderContainerView.tag = 999
        
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.center = loaderContainerView.center
        indicator.startAnimating()
        
        loaderContainerView.addSubview(indicator)
        self.view.addSubview(loaderContainerView)
        
        loaderView = loaderContainerView
    }
    
    func hideLoader() {
        DispatchQueue.main.async {
            self.loaderView?.removeFromSuperview()
            self.loaderView = nil
        }
    }
}

