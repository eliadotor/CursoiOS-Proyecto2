//
//  DetailViewControllerBuilder.swift
//  CursoiOS-Proyecto2
//
//  Created by Elia Dotor Puente on 19/1/22.
//

import Foundation
import UIKit

class DetailControllerBuilder {
    
    func build(viewModel: DetailViewModel) -> UIViewController {
        let viewController = DetailViewController.create()
        viewController.viewModel = viewModel
        return viewController
    }
}
