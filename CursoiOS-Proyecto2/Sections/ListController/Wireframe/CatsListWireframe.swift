//
//  CatsListWireframe.swift
//  CursoiOS-Proyecto2
//
//  Created by Elia Dotor Puente on 24/1/22.
//

import Foundation
import UIKit


class CatsListWireframe: CatListWireframeContract{
    var view: UIViewController?
    
    func navigate(to cat: Cat) {
        DispatchQueue.main.async {
            let viewController = DetailControllerBuilder().build(viewModel: cat.toDetailViewModel)
            if let navigationController = self.view?.navigationController {
                navigationController.pushViewController(viewController, animated: true)
            } else {
                self.view?.present(viewController, animated: true)
            }
        }
    }
}
