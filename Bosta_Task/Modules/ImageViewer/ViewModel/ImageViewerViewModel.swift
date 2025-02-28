//
//  ImageViewerViewModel.swift
//  Bosta_Task
//
//  Created by Khalid Gad on 27/02/2025.
//

import UIKit
import Combine

class ImageViewerViewModel {
    
    //MARK: - PROPIRITES
    
    @Published var selectedImage: UIImage?
    @Published var zoomScale: CGFloat = 1.0
    
    let shareImageSubject = PassthroughSubject<UIImage, Never>()
    
    //MARK: - FUNCTIONS
    
    func setSelectedImage(_ image: UIImage) {
        selectedImage = image
    }
    
    func updateZoomScale(_ scale: CGFloat) {
        zoomScale = scale
    }
    
    func shareImage() {
        guard let image = selectedImage else { return }
        shareImageSubject.send(image)
    }
}
