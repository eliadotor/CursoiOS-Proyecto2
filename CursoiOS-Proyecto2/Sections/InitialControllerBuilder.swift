//
//  InitialControllerBuilder.swift
//  CursoiOS-Proyecto2
//
//  Created by Miguel Santiago on 19/1/22.
//

import Foundation
import UIKit

class InitialControllerBuilder {
    func build() -> UIViewController {
        let viewController = ListControllerBuilder().build()
        // Cuando creamos un navigationController hay que decirle el viewController que se le va a pasar
        let navigationController = UINavigationController(rootViewController: viewController)
        
        return navigationController
    }
}
