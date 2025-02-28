//
//  AlbumDetailsTableViewCell.swift
//  Bosta_Task
//
//  Created Khalid Gad on 27/02/2025.
//

import UIKit

class AlbumDetailsTableViewCell: UITableViewCell {
    
    //MARK: - PROPIRITES
    
    static let identifier = String(describing: AlbumDetailsTableViewCell.self)
    
    //MARK: - IBOUTLETS
    
    @IBOutlet weak var albumNameLabel: UILabel!
}

//MARK: - EXTENSIONS

extension AlbumDetailsTableViewCell {
    
    //MARK: - SETUP CELL
    
    func Setup(album: AlbumsModel) {
        albumNameLabel.text = album.title
    }
}
