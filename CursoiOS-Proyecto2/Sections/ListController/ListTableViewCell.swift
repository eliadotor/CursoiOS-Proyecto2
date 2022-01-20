//
//  ListTableViewCell.swift
//  CursoiOS-Proyecto2
//
//  Created by Elia Dotor Puente on 20/1/22.
//

import UIKit
import Kingfisher

struct ListTableCellViewModel {
    let imageUrl: URL?
    let text: String
}

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBAction func favoritePressed(_ sender: Any) {
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    /* Para elegir opciones en vez de mostrar un detalle */
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func configure(viewModel: ListTableCellViewModel) {
        nameLabel.text = viewModel.text
        cellImage.kf.indicatorType = .activity
        cellImage.kf.setImage(with: viewModel.imageUrl)
    }
}
