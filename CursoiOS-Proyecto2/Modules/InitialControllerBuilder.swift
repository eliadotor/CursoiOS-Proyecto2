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
        
        let tabBarController = UITabBarController()
        /*let listViewcontroller = buildList()
        let collectioncontroller = buildCollection()
        let viewControllers = [listViewcontroller, collectioncontroller]*/
        let viewControllers = [buildList(), buildCollection(), buildForm()]
        tabBarController.setViewControllers(viewControllers, animated: false)
        return tabBarController
    }
}


private extension InitialControllerBuilder {
    func buildList() -> UINavigationController {
        let viewController = ListControllerBuilder().build()
        let tabBarItem = UITabBarItem(title: "List", image: UIImage.init(systemName: "list.bullet"), tag: 0)
        return buildNavigation(with: viewController, tabBarItem: tabBarItem)
    }
    
    func buildCollection() -> UINavigationController {
        let viewController = CollectionControllerBuilder().build()
        let tabBarItem = UITabBarItem(title: "Collection", image: UIImage.init(systemName: "pencil"), tag: 1)
        return buildNavigation(with: viewController, tabBarItem: tabBarItem)
    }
    
    func buildNavigation(with viewController: UIViewController, tabBarItem: UITabBarItem) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem = tabBarItem
        return navigationController
    }

    func buildForm() -> UIViewController {
        let viewController = UserFormBuilder().build()
        viewController.tabBarItem = UITabBarItem.init(title: "Form", image: UIImage(systemName: "pencil.and.outline"), tag: 2)
        return viewController
    }
}
