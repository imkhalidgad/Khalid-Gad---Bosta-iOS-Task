//
//  imagesCollectionViewCell.swift
//  Bosta_Task
//
//  Created by Khalid Gad on 27/02/2025.
//

import UIKit
import Kingfisher

class imagesCollectionViewCell: UICollectionViewCell {
    
    //MARK: - IBOUTLETS
    
    @IBOutlet weak var imageView: UIImageView!
    
    //MARK: - PROPIRITES
    
    static let identifier = String(describing: imagesCollectionViewCell.self)
}

//MARK: - EXTENSIONS

extension imagesCollectionViewCell {
    
    //MARK: - SETUP CELL
    
    func setupCell(images: ImagesModel) {
        let imageUrl = images.url.asUrl
        imageView.kf.setImage(with: imageUrl)
    }
}
