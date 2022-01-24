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
        let interactor = CatsListInteractor()
        let wireframe = CatsListWireframe()
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.wireframe = wireframe
        wireframe.view = viewController
        return viewController
    }
        
}
