//
//  UserFormBuilder.swift
//  CursoiOS-Proyecto2
//
//  Created by Elia Dotor Puente on 25/1/22.
//

import Foundation
import UIKit


class UserFormBuilder {
    func build() -> UIViewController {
        let viewController = UserFormViewController.createFromStoryBoard()
        let presenter = UserFromPresenter()
        presenter.view = viewController
        viewController.presenter = presenter
        return viewController
    }
}
