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
        // inyeccion de dependencias
        viewController.fetchLandmarks = FetchLandmarksFromDisk()
        viewController.detailBuilder = DetailControllerBuilder()
        return viewController
    }
        
}
