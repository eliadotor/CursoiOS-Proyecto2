//
//  CollectionControllerBuilder.swift
//  CursoiOS-Proyecto2
//
//  Created by Elia Dotor Puente on 19/1/22.
//

import Foundation
import UIKit


class CollectionControllerBuilder {
    func build() -> UIViewController {
        let viewController = CollectionViewController.createFromStoryBoard()
        return viewController
    }
}
