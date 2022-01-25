//
//  CollectionCollectionViewCell.swift
//  CursoiOS-Proyecto2
//
//  Created by Elia Dotor Puente on 19/1/22.
//

import UIKit

struct CollectionCollectionCellViewModel {
    let name: String
    let image: UIImage?
}

class CollectionCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func configure(with viewModel: CollectionCollectionCellViewModel) {
        
        nameLabel.text = viewModel.name
        imageView.image = viewModel.image
        
        contentView.layer.borderColor = UIColor.gray.cgColor
        contentView.layer.cornerRadius = 20
        contentView.layer.masksToBounds = true
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = .init(width: 2.0, height: 3.0) 
        layer.shadowRadius = -2.0
        layer.shadowOpacity = -1.0
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
        
    }
}
