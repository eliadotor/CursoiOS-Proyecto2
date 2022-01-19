//
//  DetailViewController.swift
//  CursoiOS-Proyecto2
//
//  Created by Elia Dotor Puente on 19/1/22.
//

import UIKit

struct DetailViewModel {
    let name: String
    let image: UIImage?
}
class DetailViewController: UIViewController {

    @IBOutlet weak var detailImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    static func create() -> DetailViewController {
        return DetailViewController(nibName: "DetailViewController", bundle: .main)
    }
    
    var viewModel: DetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure(width: viewModel)
        // Do any additional setup after loading the view.
    }
    
    func configure(width viewModel: DetailViewModel?) {
        guard let viewModel = viewModel else { return }
        detailImage.image = viewModel.image
        nameLabel.text = viewModel.name
    }

    

}
