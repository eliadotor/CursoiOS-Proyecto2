//
//  CatsToCatsListWireframe.swift
//  CursoiOS-Proyecto2
//
//  Created by Elia Dotor Puente on 26/1/22.
//

import Foundation
import UIKit

class CatsToCatsWireframe: CatsListWireframeContract{
    weak var view: UIViewController?
    
    func navigate(to cat: Cat) {
        DispatchQueue.main.async {
            let viewController = ListControllerBuilder().build()
            if let navigationController = self.view?.navigationController {
                navigationController.pushViewController(viewController, animated: true)
            } else {
                self.view?.present(viewController, animated: true)
            }
        }
    }
    deinit {
        print("deinit \(self)")
    }
}
