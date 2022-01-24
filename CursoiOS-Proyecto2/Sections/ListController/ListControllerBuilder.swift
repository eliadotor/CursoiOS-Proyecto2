//
//  ListControllerBuilder.swift
//  CursoiOS-Proyecto2
//
//  Created by Elia Dotor Puente on 19/1/22.
//

import Foundation
import UIKit

class ListControllerBuilder {
    
    func build()-> UIViewController {
        let viewController = ListViewController.createFromStoryBoard()
        let presenter = CatsListPresenter()
        let fetchCats = FetchCatsFromApi()
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.fetchCats = fetchCats
        return viewController
    }
        
}
