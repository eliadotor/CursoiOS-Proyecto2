//
//  PermissionBuilder.swift
//  CursoiOS-Proyecto2
//
//  Created by Elia Dotor Puente on 27/1/22.
//

import Foundation
import UIKit

class PermissionsBuilder {
    func build() -> UIViewController {
        let viewController = PermissionsViewController.createFromStoryBoard()
        viewController.presenter = buildPresenter()
        return viewController
    }
    func builderForTabBar(tag: Int) -> UIViewController {
        let viewController = build()
        viewController.tabBarItem = .init(title: "permissions", image: nil, tag: tag)
        return viewController
    }
}

private extension PermissionsBuilder {
    func buildInteractor() -> PermissionaInteractorContract {
        LocationPermissionInteractor()
    }
    func buildPresenter() -> PermissionPresenterContract {
        PermissionsPresenter(interactor: buildInteractor())
    }
}
